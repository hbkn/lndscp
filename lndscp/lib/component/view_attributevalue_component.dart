library view_attributevalue_component;

import 'package:angular/angular.dart';
import 'dart:html';
import '../model/model.dart';


@NgComponent(
    selector: 'view-attributevalue',
    cssUrl: '../lib/component/view_attributevalue_component.css',
    templateUrl: '../lib/component/view_attributevalue_component.html',
    publishAs: 'cmp'
)
class ViewAttributeValueComponent implements NgShadowRootAware {
  
  @NgTwoWay('objectattribute')
  ObjectAttribute attribute;  

  @NgTwoWay('readonly')
  bool readonly = true;  

  ViewAttributeValueComponent() {
  }
  
  void onShadowRoot(ShadowRoot shadowRoot) {
    shadowRoot.querySelector('#myDiv').children.add(
//      new ParagraphElement()..text = 'Dynamically added content'
      new SpanElement()..text = ''
    );
  }
}