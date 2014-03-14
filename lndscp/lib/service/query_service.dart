library query_service;

import 'dart:async';
//import 'dart:convert';

import 'package:angular/angular.dart';
import '../model/model.dart';

class QueryService {  
//  String _prefix = 'emt-';
  String _prefix = 'demo-';
  Http _http;
  Configuration configuration;
  List<ApplicationComponent> applications;
  Map<String, ApplicationComponent> applicationMap;  
  List<Service> services;
  Map<String, Service> serviceMap;
  List<Person> people;
  Map<String, Person> peopleMap;
    
  QueryService(Http this._http) {
  }

  Future loadApplications() {
    return _loadApplicationsFromLocalServerNew();
  }
  Future loadServices() {
    return _loadServicesFromLocalServerNew();
  }
  Future loadConfiguration() {
    Future future =  _loadConfigurationFromLocalServerNew();
    return future;
  }  
  Future loadPeople() {
    Future future =  _loadPeopleFromLocalServerNew();
    return future;
  }  
  Future _loadConfigurationFromLocalServerNew() {
    if (this.configuration != null)
      return  new Future.sync((){});    
    String url = '../data/${_prefix}configuration.json';
    return _http.get(url)
        .then((HttpResponse response) {
            Map appsJsonData = response.data;
            Configuration config = new Configuration.fromMap(appsJsonData);
            this.configuration = config;
          });
  }
  Future _loadApplicationsFromLocalServerNew() {
    if (this.applications != null)
      return  new Future.sync((){});
    String url = '../data/${_prefix}applications.json';
    return _http.get(url)
        .then((HttpResponse response) {
            Map appsJsonData = response.data;
            Map resultMsg = appsJsonData['GetApplicationsJSONResult'];
            List appsList = resultMsg['ApplicationComponents'];           
            List result = [] ;
            Map resultMap = {};
            ObjectType appObjectType = configuration.objectTypes['ApplicationComponent'];
            for (Map appMap in appsList) {
              ObjectData data = new ObjectData.fromJsonMap(appObjectType, appMap);
              // Workaround !!!
              if (_prefix == 'emt-') {
               String id = '${appMap[configuration.idName]}';
               String name = appMap['Name'];
                                     if (id != null)
                                       data.setAttWithJsonValue(configuration.idName, id);
                                     if (name != null)
                                       data.setAttWithJsonValue('Name', name);
              }
              ApplicationComponent appComp = new ApplicationComponent();
              appComp.data = data;
              result.add(appComp);
              resultMap[appComp.data.id] = appComp;
            }
            this.applications =  result;
            this.applicationMap = resultMap;
          });
  }
/*  
  Future _loadServicesFromLocalServerNew() {
    if (this.services != null)
      return  new Future.sync((){});
    String url = '../data/services.json';
    return _http.get(url)
        .then((HttpResponse response) {
            Map appsJsonData = response.data;
            this.services = _parseGetServicesReply(appsJsonData);
          });
  }
*/  
  Future _loadServicesFromLocalServerNew() {
    if (this.services != null)
      return  new Future.sync((){});
    String url = '../data/${_prefix}services.json';
    return _http.get(url)
        .then((HttpResponse response) {
            Map appsJsonData = response.data;
            Map resultMsg = appsJsonData['GetServicesJSONResult'];
            List objList = resultMsg['Services'];           
            List result = [] ;
            Map resultMap = {};
            ObjectType serviceType = configuration.objectTypes['Service'];
            for (Map objMap in objList) {
              ObjectData data = new ObjectData.fromJsonMap(serviceType, objMap);
              
              // Workaround !!!
              if (_prefix == 'emt-') {
               String id = '${objMap[configuration.idName]}';
               String name = objMap['Name'];
                                     if (id != null)
                                       data.setAttWithJsonValue(configuration.idName, id);
                                     if (name != null)
                                       data.setAttWithJsonValue('Name', name);
              }
              Service obj = new Service();
              obj.data = data;
              result.add(obj);
              resultMap[obj.data.id] = obj;
            }
            this.services =  result;
            this.serviceMap = resultMap;
          });
  }
  Future _loadPeopleFromLocalServerNew() {
    if (this.services != null)
      return  new Future.sync((){});
    String url = '../data/${_prefix}people.json';
    return _http.get(url)
        .then((HttpResponse response) {
            Map appsJsonData = response.data;
            Map resultMsg = appsJsonData['GetPeopleJSONResult'];
            List objList = resultMsg['People'];           
            List result = [] ;
            Map resultMap = {};
            ObjectType serviceType = configuration.objectTypes['People'];
            for (Map objMap in objList) {
              ObjectData data = new ObjectData.fromJsonMap(serviceType, objMap);
              Person obj = new Person();
              obj.data = data;
              result.add(obj);
              resultMap[obj.data.id] = obj;
            }
            this.people =  result;
            this.peopleMap = resultMap;
          });
  }  
}
