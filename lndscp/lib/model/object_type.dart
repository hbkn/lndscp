part of model;

class RefToObjectType extends ObjectType {
  RefToObjectType(String name): super.fromJsonMap({'name': name}) {
  }
}

class ObjectType {
  String name;
  Map<String, AttributeDescription> attributeDescriptions = {};
  String implementationType;
  Configuration configuration;
  String groupName;
  
  ObjectType.fromJsonMap(Map data) {
    _parseJsonMap(data);
  }
  _parseJsonMap(Map data) {
    name = data['name'];
    implementationType = data['implementationType'];
    if (implementationType == null)
      implementationType = name;
    List attDescs = data['attributeDescriptions'];
    if (attDescs != null) {
      for (Map attDescMap in attDescs) {
        AttributeDescription attDesc = new AttributeDescription.fromJson(attDescMap);
        attributeDescriptions[attDesc.name] = attDesc;
      }
    }
  }
  
  String toString() {
    return name;
  }
/*  
  @observable
  Map objectsById = toObservable({});
  @observable
  Map objectsByName = toObservable({});
  CbObjectType() {
  }
  List<CbObjectData> retrieveAllObjectDataWithSynonymThatContains(String str) {
    List result = [];
    bool alwaysAdd = (str == '');
    for (CbObjectData objectData  in objectsByName.values) {
      if ( (alwaysAdd) || (objectData.doesSynonymsContains(str)) )
        result.add(objectData);
    }
    return result;
  }

  CbObjectType.fromJsonMap(Map data) {
    objectsById = {};
    objectsByName = {};
    _parseJsonMap(data);
  }
  Map asMap() {
    Map map = {};
    map['name'] = name;
    map['implementationType'] = implementationType;
    List objectList = [];
    map['objects'] = objectList;
    for (String objectId in objectsById.keys) {
      CbObjectData objectData = objectsById[objectId];
      Map objectAsMap = objectData.asMap();
      objectList.add(objectAsMap);
    }
    return map;
  }
  _parseJsonMap(Map data) {
    name = data['name'];
    implementationType = data['implementationType'];
    List objectsList = data['objects'];
    if (objectsList != null) {
      for (var objData in objectsList) {
        CbObjectData obj = new CbObjectData.fromJsonMap(objData);
        if (objectsById.containsKey(obj.id)) {
          throw new Exception("duplicate key: ${obj.id}");
        }
        objectsById[obj.id] = obj;
        if (objectsByName.containsKey(obj.name)) {
          throw new Exception("duplicate name: ${obj.name}");
        }
        objectsByName[obj.name] = obj;
        obj.objectType = this;
      }
    }
  }

  */
}