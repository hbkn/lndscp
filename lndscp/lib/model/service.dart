part of model;

class Service {
  ObjectData data;
  List<ApplicationComponent> requestors = [];
  ApplicationComponent provider; 
  
  Service():super() {
  }   
  String toString() {
    return name;
  }
  String get name {
    return data.getAttVal(data.type.configuration.nameName);
  }
}