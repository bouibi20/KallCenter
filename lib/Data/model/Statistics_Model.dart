import 'dart:ffi';

class Statistics_Model {
  late String? status;
  late double? price;
  late int? command;

  Statistics_Model(this.status, this.price, this.command);

  static List<Statistics_Model> fromJsontolist(Map<String, dynamic> jsonList) {
    List<Statistics_Model> productList = [];
    jsonList.forEach((key, value) {
      print(value['count']);
      print(key);
      print(value['sum']);

      productList.add(Statistics_Model(
        key,
        (value['sum'] as num?)?.toDouble(),
        value['count'],
      ));
    });
    return productList;
  }
}
