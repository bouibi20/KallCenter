class Commandes_Model {
  late String? id;
  late String? reference;
  late String? phone;
  late String? client;
  late double? price;
  late String? city;
  late String? adress;
  late DateTime? created_at;

  Commandes_Model(this.id, this.reference, this.client, this.adress, this.city,
      this.phone, this.price, this.created_at);

  Commandes_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    phone = json['phone'];
    client = json['client'];
    price = json['price'];
    city = json['city'];
    adress = json['adress'];
    created_at = json['created_at'];
  }

  Commandes_Model.fromJsonUpdate(
      Map<String, dynamic> json, Commandes_Model user) {
    id = json['name'];
    reference = json['reference'];
  }
}
