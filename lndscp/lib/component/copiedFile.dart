library view_objectdata_component;

import '../model/model.dart';
import 'package:angular/angular.dart';

@NgComponent(
    selector: 'view-objectdata',
    templateUrl: 'packages/landscape/component/view_objectdata_component.html',
    cssUrl: 'packages/landscape/component/view_objectdata_component.css',
    publishAs: 'ctrl'
)
class ViewObjectDataComponent {
  @NgTwoWay('objectdata-map')
  Map<String, ObjectData> dataMap;
  
  String _id;
  
  ViewObjectDataComponent(RouteProvider routeProvider) {
    _id = routeProvider.parameters['id'];
    print('ViewObjectDataComponent: id is $_id');
  }
  ObjectData get data  {
    ObjectData val = dataMap[_id];
//    print('ViewObjectDataComponent: data is $val');
    return val;
  }
  
  List<ObjectAttribute> get attributes {
    List<ObjectAttribute> list = [];
    for (ObjectAttribute simAtt in data.attributes.values) {
      list.add(simAtt);
    }
    return list;
  }
  debug(var object) {
    print(object);
  }
}
