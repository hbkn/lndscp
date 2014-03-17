part of model;

class Person {
  static String TYPE = 'Person';
  
  ObjectData data;

  Person() {
  }
  String get firstName {
    return data.getAttVal('FirstName');
  }
  String get lastName {
    return data.getAttVal('LastName');
  }
  String get name =>  '$firstName $lastName';
}