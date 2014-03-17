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
  String get name => data.getAttVal(data.type.configuration.nameName);
/*
  onDataChanged() {
    name = data.getAttVal(data.type.configuration.nameName);
  }
  */  
}