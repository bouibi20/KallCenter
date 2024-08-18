import 'package:kallcenter/Data/model/product.dart';

class Commandes_Model {
  late String? id;
  late String? reference;
  late String? phone;
  late String? client;
  late double? price;
  late String? city;
  late String? address;
  late List<Product_Model> products;
  late String? state;
  late String? color;
  late DateTime? created_at;

  Commandes_Model(
      this.id,
      this.reference,
      this.client,
      this.address,
      this.city,
      this.phone,
      this.price,
      this.products,
      this.state,
      this.color,
      this.created_at);

  Commandes_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    phone = json['phone'];
    client = json['client'];
    price = json['price'];
    city = json['city'];
    address = json['adress'];
    products.addAll(Product_Model.fromJsontolist(json['products']));
    created_at = json['created_at'];
  }

  // Commandes_Model.fromJsonUpdate(
  //     Map<String, dynamic> json, Commandes_Model user) {
  //   id = json['name'];
  //   reference = json['reference'];
  // }
}
