library view_objectdata_component;

import 'package:angular/angular.dart';
import 'dart:html';
import '../model/model.dart';
import 'view_attributevalue_component.dart';

@NgComponent(
    selector: 'view-objectdata',
    cssUrl: '../lib/component/view_objectdata_component.css',
    templateUrl: '../lib/component/view_objectdata_component.html',
    publishAs: 'cmp'
)
class ViewObjectDataComponent implements NgShadowRootAware {
  
  Map _objectMap;  
  @NgOneWay('readonly')
  bool readonly = true;  
  @NgOneWay('editLink')
  String theEditLink;  
  String _id;
  Map<String, ViewAttributeValueComponent> attributeViews = {};
  
  ViewObjectDataComponent(RouteProvider routeProvider) {
    _id = routeProvider.parameters['id'];
  }
  
  bool get hasEditLink => theEditLink != null;
  String get editLink => theEditLink.replaceAll('<id>', _id);

  get objectMap {
    return _objectMap;
  }
  @NgOneWay('object-map')
  set objectMap(var val) {
     _objectMap = val;
     print('just set objectMap: $val');
  }  
  get object  {
      print('get obect ($_id): objectMap is $objectMap');
      if (objectMap == null)
        return null;
      return objectMap[_id];
  }
  ObjectData get data {
    if (object == null)
      return null;
    return object.data; 
  }
  void save() {
    print('save');
    ObjectData data = this.data;
    for (var att in data.attributeList) {
      String attName = att.description.name;
      ViewAttributeValueComponent attView = attributeViews[attName];
      if (attView == null) {
        print("$attName : view is null");
      }
      else {
        print('$attName : old = ${att.value} ');        
      }
      
     print("$att"); 
    }
  }
  void onShadowRoot(ShadowRoot shadowRoot) {
    print('onShadowRoot: objectMap=$objectMap');
  }
  void registerAttributeValueView(ViewAttributeValueComponent attView) {
//   print('registered $attView'); 
   attributeViews[attView.attribute.description.name] = attView;
  }
}