import 'package:kallcenter/Data/model/Strore.dart';

class User_Model {
  late String? email;
  late String? name;
  late String? image;
  late String? token;
  List<Store_Model> stores = [];
  User_Model(this.email, this.name, this.image, this.stores, this.token);

  User_Model.fromJson(Map<String, dynamic> json) {
    token = json['access_token'];
    json = json["data"];
    email = json['email'];
    name = json['name'];
    image = json['avatar_url'];
    stores.addAll(Store_Model.fromJsontolist(json['stores']));
  }

  // User_Model.fromJsonUpdate(Map<String, dynamic> json, User_Model user) {
  //   email = json['email'];
  //   name = json['name'];
  //   token = json['token'];
  // }

  // Map<String, dynamic> StoretoString() {
  //   return {
  //     'email': email,
  //     'password': Password,
  //   };
  // }
}
