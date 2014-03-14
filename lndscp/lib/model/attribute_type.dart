part of model;

class AttributeType {
  String description;
  static Map<String, AttributeType> _cache = new Map<String, AttributeType>();  
    
  static String SingleSelectionFromList = "SingleSelectionFromList";
  static String MultiSelectionFromList = "MultiSelectionFromList";
//  static String Link = "Link";
  static String Text_TYPE = "Text";
  static String Date = "Date";
  static String Timestamp = "Timestamp";
  static String LinkWithDescription_TYPE = "LinkWithDescription";
  static String Integer = "Integer";
  static String Boolean = "Boolean";
  
  factory AttributeType(String desc) {
      if (_cache.containsKey(desc)) {
        return _cache[desc];
      }
      else {
        final attType = new AttributeType._internal(desc);
        _cache[desc] = attType;
        return attType;
      }
  }
  AttributeType._internal(this.description);
  
  valueFromJson(var value) {
    if (value == null)
      return null;
    if (Text_TYPE == description)
      return value.toString();
    if (LinkWithDescription_TYPE == description)
      return new LinkWithDescription.fromJsonMap(value);
    return value.toString();
  }
}