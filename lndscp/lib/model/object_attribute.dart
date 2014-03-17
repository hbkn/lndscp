part of model;

class ObjectAttribute {
  AttributeDescription description;
  var value;
  bool get isLinkWithDescription {
    return description.attributeType.description == AttributeType.LinkWithDescription_TYPE;
  }
  bool get isText {
    return description.attributeType.description == AttributeType.Text_TYPE;
  }
  String toString() {
   return '$value';
  }
  bool isContentEqual(ObjectAttribute other) {
    if (this.value == null)
      return other.value == null;
    return this.value == other.value;
  }
}