import 'dart:convert';

class Store_Model {
  late String? name;
  late int? id;

  Store_Model(this.id, this.name);

  Store_Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  // Store_Model.fromJsontolist(Map<String, dynamic> json, Store_Model user) {
  //   name = json['name'];
  // }

  static List<Store_Model> fromJsontolist(List<dynamic> jsonList) {
    List<Store_Model> storesList = [];
    for (var item in jsonList) {
      var json = item as Map<String, dynamic>;
      storesList.add(Store_Model(json['id'], json['name']));
    }
    return storesList;
  }

  static String ListStoretoSting(List<Store_Model> mapdata) {
    String result = '[';
    bool isFirst = true;
    for (var map in mapdata.reversed) {
      // if (isFirst) {
      //   result += '"id": ${map['id']},"name":"${map['name']}"';
      //   isFirst = false;
      // } else {
      //   result += ', "id": ${map['id']},"name":"${map['name']}"';
      // }
      if (isFirst) {
        result += '{"id": ${map.id},"name":"${map.name}"}';
        isFirst = false;
      } else {
        result += ',{ "id": ${map.id},"name":"${map.name}"}';
      }
    }
    result += ']';
    return result;
  }

// convert string to list Store_Model for data in local storage
  static List<Store_Model> StringToListStore(String? input) {
    List<Map<String, dynamic>> jsonList =
        jsonDecode(input!).cast<Map<String, dynamic>>();
    return fromJsontolist(jsonList);
  }
}
