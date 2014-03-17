library view_attributevalue_component;

import 'package:angular/angular.dart';
import 'dart:html';
import '../model/model.dart';
import 'view_objectdata_component.dart';

@NgComponent(
    selector: 'view-attributevalue',
    cssUrl: '../lib/component/view_attributevalue_component.css',
    templateUrl: '../lib/component/view_attributevalue_component.html',
    publishAs: 'cmp'
)
class ViewAttributeValueComponent implements NgShadowRootAware {
  
    ViewObjectDataComponent _viewObjDataComp;

  @NgOneWay('objectattribute')
  ObjectAttribute attribute;  

  @NgOneWay('readonly')
  bool readonly = true;  

  ViewAttributeValueComponent() {
  }
  
  @NgOneWay('view-objectdata-component')
  set viewObjDataComp(var val) {
    _viewObjDataComp = val;
    val.registerAttributeValueView(this);
  }
  get viewObjDataComp => _viewObjDataComp; 
  void onShadowRoot(ShadowRoot shadowRoot) {
/*    
    shadowRoot.querySelector('#myDiv').children.add(
//      new ParagraphElement()..text = 'Dynamically added content'
      new SpanElement()..text = ''
    );
*/    
  }
}