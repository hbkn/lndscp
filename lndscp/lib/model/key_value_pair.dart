part of model;

class KeyValuePair {
  String key;
  String value;
  String origValue;
  KeyValuePair(this.key, this.value) {
    this.origValue = value;
  }
  String toString() {
    String str = '${key}: ${value}';
    bool changed = (value !=  origValue);
    if (changed) {
      str = '$str (used to be: ${origValue})';
    }
    return str;
  }
}
