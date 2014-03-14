part of model;

class Person {
  static String TYPE = 'Person';
  
  ObjectData data;
  
  List<ApplicationComponent> primaryApps = [];
  List<ApplicationComponent> secondaryApps = [];
  
  Person() {
  }
  String get firstName {
    return data.getAttVal('firstName');
  }
  String get lastName {
    return data.getAttVal('lastName');
  }
}