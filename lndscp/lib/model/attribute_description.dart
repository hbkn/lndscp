part of model;

class AttributeDescription {
  String name;
  int index;
  bool multipleAllowed = false;
  AttributeType attributeType;
  
  AttributeDescription.fromJson(Map map) {
    this.name = map['name'];
    this.index = map['index'];
    if (map['multipleAllowed'] != null)
      this.multipleAllowed = map['multipleAllowed'];
    String attributeTypeStr = map['attributeType'];
    this.attributeType = new AttributeType(attributeTypeStr);
  }
  
}