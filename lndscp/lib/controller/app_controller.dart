library landscape_app_controller;

import 'package:angular/angular.dart';

import '../model/model.dart';
import '../service/query_service.dart';

import 'dart:async';

@NgController(
    selector: '[app-controller]',
    publishAs: 'ctrl')
class AppController {
  String activeMainSection;
  List<String> messages = [];
  QueryService _queryService;  
  bool loading = true;
//  Future serviceLoader;
  
  static String applications_SECTION = 'applications';
  static String services_SECTION = 'services';
  static String people_SECTION = 'people';
    
  
  Configuration get configuration => _queryService.configuration;
  List<ApplicationComponent> get applications  =>_queryService.applications;  
  Map<String, ApplicationComponent> get applicationMap {
    return _queryService.applicationMap;  
  }
  List<Service> get services => _queryService.services;
  Map<String, Service> get serviceMap => _queryService.serviceMap;
  List<Person> get people => _queryService.people;
  Map<String, Person> get peopleMap => _queryService.peopleMap;
  
  
  String appNameFilterSelector = '';
  String personFilterSelector = '';
  
  AppController(QueryService this._queryService) {
    loading = true;
    print('${new DateTime.now()} - loading data ...');
    messages.insert(0, 'loading data at ${new DateTime.now()} ...');
    _queryService.loadConfiguration()
      .then((_) {
        print('${new DateTime.now()} loaded configuration: ${_queryService.configuration}');
        onConfigurationLoaded(_queryService.configuration);
        return _queryService.loadApplications();
      })
      .then((_) {
        print('${new DateTime.now()} loaded applications: ${_queryService.applications}');
        onApplicationsLoaded(_queryService.applications);
        return  _queryService.loadServices();
      })
      .then((_) {
        print('${new DateTime.now()} loaded services: ${_queryService.services}');
        onServicesLoaded(_queryService.services);
        return _queryService.loadPeople();
      })
    .then((_) {
      print('${new DateTime.now()} loaded people: ${_queryService.people}');
      onPeopleLoaded(_queryService.people);
      loading = false;
    }); 
  }
  
  Configuration get config => _queryService.configuration;
  
  bool appNameFilterString(String name) {
    return true;
  }
  
  bool doesAppNameContainsStr(ApplicationComponent appComp) {
    return true;
//    return appComp.name.contains(appNameFilterSelector);
  }
  void clearAppNameFilterSelector() {
    appNameFilterSelector = '';
  }  
  void clearPersonFilterSelector() {
    personFilterSelector = '';
  }  
  debug(var object) {
    print(object);
  }
  onConfigurationLoaded(Configuration config) {
    messages.insert(0, 'loaded configuration at ${new DateTime.now()}.');
  }
  onServicesLoaded(List<Service> services) {
    messages.insert(0, 'loaded services at ${new DateTime.now()}.');
  }  
  onApplicationsLoaded(List<ApplicationComponent> applicationComponents) {
    messages.insert(0, 'loaded applications at ${new DateTime.now()}.');
  }  
  onPeopleLoaded(List<Person> people) {
    messages.insert(0, 'loaded people at ${new DateTime.now()}.');
  }  
  void changeMainSection(String section) {
    activeMainSection = section;
  }
  
  String tabClassForMainSection(String section) {    
//    if (section == activeMainSection) {
    if (true) {
      return 'active';
    }
    return '';
  }
  Map<String, ObjectData> asDataMap(List  list) {
    Map<String, ObjectData> result = {};
    if (list == null)
      print('FYI: ${new Exception('list is null !')}');
    else {
      for (var obj in list) {
        result[obj.data.id] = obj.data;
      }
    }
    return result;
  }
}