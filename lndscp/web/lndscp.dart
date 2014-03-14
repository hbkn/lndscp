//import 'dart:html';

import 'package:angular/angular.dart';
import '../lib/service/query_service.dart'; 
import '../lib/controller/app_controller.dart'; 
import '../lib/router/app_router.dart'; 
import '../lib/component/view_objectdata_component.dart'; 
import '../lib/component/view_attributevalue_component.dart'; 


void main() {
/*  
  querySelector("#sample_text_id")
      ..text = "Click me!"
      ..onClick.listen(reverseText);
*/  
  ngBootstrap(module: new MyAppModule());
}
/*
void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}
*/
class MyAppModule extends Module {
  MyAppModule() {
    type(RouteInitializer, implementedBy: AppRouteInitializer);    
    type(QueryService);    
    type(AppController);    
    type(ViewAttributeValueComponent);        
    type(ViewObjectDataComponent);        
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));    
  }
}