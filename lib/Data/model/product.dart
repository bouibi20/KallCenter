class Product_Model {
  late String? id;
  late String? name;
  late String? quantity;

  Product_Model(this.id, this.name, this.quantity);

  Product_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
  }
  static List<Product_Model> fromJsontolist(
      List<Map<String, dynamic>> jsonList) {
    List<Product_Model> productList = [];
    for (var json in jsonList) {
      productList.add(Product_Model(
        json['id'],
        json['name'],
        json['quantity'],
      ));
    }
    return productList;
  }

  // Product_Model.fromJsonUpdate(Map<String, dynamic> json, Product_Model user) {
  //   id = json['name'];
  //   name = json['name'];
  //   quantity = json['quantity'];

  // }
}
