part of model;

class ObjectData {  
  ObjectType type;
  Map<String, ObjectAttribute> attributes = {};
  List<ObjectAttribute> _attributeList;
  
  get id {
    String id = getAttVal(type.configuration.idName);
    return id;
  }
  set id(String val) {
    setAttWithJsonValue(type.configuration.idName, val);    
  }
  
  ObjectData() {
//    owner.data = this;
  }
  ObjectData.fromJsonMap(ObjectType this.type, Map data) {
    _parseJsonMap( data);
  }
  _parseJsonMap(Map data) {     
    List attList = data['attributes'];
    if (attList == null)
      attList = data['Attributes'];    
    for (Map attKv in attList) {
      String key = attKv[type.configuration.keyName];
      var value = attKv[type.configuration.valueName];
      if (value != null) {
        setAttWithJsonValue(key, value);
      }      
    }
//    owner.onDataChanged();
  }
  
  List<ObjectAttribute> get attributeList {
    if (this._attributeList == null) {
      _attributeList = [];
      for (var val in attributes.values) {
        _attributeList.add(val);
      }
    }
    return _attributeList;
  }
  setAttWithJsonValue(String key, var value) {
    AttributeDescription attDesc = this.type.attributeDescriptions[key];
    if (attDesc == null)
      throw new Exception("objct type $type does not have attribute $key.  impossible to set value $value");
    ObjectAttribute att = this.attributes[key];
    if (att == null) {
      att = new ObjectAttribute();
      this.attributes[key] = att;
    }
    att.description = attDesc;    
    if (attDesc.multipleAllowed) {
      att.value = [];
      for (var record in value) {
        att.value.add(attDesc.attributeType.valueFromJson(record));
      }
    }
    else {
      att.value = attDesc.attributeType.valueFromJson(value);
    }
    _attributeList = null;
//    owner.onDataChanged();
  }  
  getAttVal(String name) {    
    ObjectAttribute att = attributes[name];
    if (att == null)
      return null;
    return att.value;
  }
  String shortIntroForAtt(String attName, int maxLength) {
    String description = getAttVal(attName);
    if (description == null)
      return null;
    if (description.length <= maxLength)
      return description;
    return '${description.substring(0, maxLength)}...';
  }
  String toString() {
    return '${type}: ${id}';
  }
}