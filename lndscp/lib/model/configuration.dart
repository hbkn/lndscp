part of model;

class Configuration {
  Map<String, ObjectType> objectTypes = {};

  
  bool camelCaseBase;
  String idName;
  String keyName;
  String valueName;
  String nameName;
//  String descriptionName;
  
  Configuration.fromMap(Map map) {
    camelCaseBase = map['camelCaseBase'];
    if (camelCaseBase == null)
      camelCaseBase = true;
    idName = map['idName'];
    keyName = map['keyName'];
    valueName = map['valueName'];
    nameName = map['nameName'];
    
    List objectTypesList = map['objectTypes'];
    if (objectTypesList != null) {
      for (Map otm in objectTypesList) {
        ObjectType ot = new ObjectType.fromJsonMap(otm);
        ot.configuration = this;
        objectTypes[ot.name] = ot;
      }
    }
  }
}