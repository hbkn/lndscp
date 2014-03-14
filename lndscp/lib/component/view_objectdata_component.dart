library view_objectdata_component;

import 'package:angular/angular.dart';
import 'dart:html';
import '../model/model.dart';


@NgComponent(
    selector: 'view-objectdata',
    cssUrl: '../lib/component/view_objectdata_component.css',
    templateUrl: '../lib/component/view_objectdata_component.html',
    publishAs: 'cmp'
)
class ViewObjectDataComponent implements NgShadowRootAware {
  
  @NgTwoWay('objectdata-map')
  Map<String, ObjectData> dataMap;  
  @NgTwoWay('readonly')
  bool readonly = true;  

  @NgTwoWay('editLink')
  String theEditLink;  

  String _id;
  
  ViewObjectDataComponent(RouteProvider routeProvider) {
    _id = routeProvider.parameters['id'];
  }
  
  bool get hasEditLink => theEditLink != null;
  String get editLink => theEditLink.replaceAll('<id>', _id);

  ObjectData get data  {
    ObjectData val = dataMap[_id];
    return val;
  }
  
  List<ObjectAttribute> get attributes {
    List<ObjectAttribute> list = [];
    for (ObjectAttribute simAtt in data.attributes.values) {
      list.add(simAtt);
    }
    return list;
  }

  void onShadowRoot(ShadowRoot shadowRoot) {
    shadowRoot.querySelector('#myDiv').children.add(
        new SpanElement()..text = ''
    );
  }
}