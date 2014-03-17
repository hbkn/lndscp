part of model;

class LinkWithDescription {
  String link;
  String name;
  String description;
  
  LinkWithDescription.fromJsonMap(Map data) {
    this.link = data['link'];
    this.name = data['name'];
    this.description = data['description'];    
  }
  String toString() {
    return toHtml();
//    return '$name $link $description';
  }
  String toHtml() {
    return '<a href=\"$link\">$name</a>:  $description';
  }
  bool equals(val) {
    return this.toString() == val.toString();
  }
}