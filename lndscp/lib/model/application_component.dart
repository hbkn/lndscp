part of model;

class TmpApplicationComponent extends ApplicationComponent {
  String _name;
  TmpApplicationComponent(): super() {
  }
  bool isTmp() {
    return true;
  }
  String get name => _name;
  void set name(String val) {
    _name = val;
  }
}
class ApplicationComponent {
  static String TYPE = 'ApplicationComponent';
  ObjectData data;
  ApplicationComponent parent;
  List<ApplicationComponent> children = [];
  List<Service> servicesUsed = [];
  
  ApplicationComponent() {
  }

  bool isTmp() {
    return false;
  }
  
  String toString() {
    return name;
  }
  bool isTopApplication() {
    return parent == null;
  }
  ApplicationComponent get topApplication {
    if (isTopApplication()) {
      return this;
    }
    return parent.topApplication;
  }
  String get name {
    return data.getAttVal(data.type.configuration.nameName);
  }
}