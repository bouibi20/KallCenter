class User_Model {
  late String? name;
  late int? id;

  User_Model(this.name);

  User_Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  User_Model.fromJsonUpdate(Map<String, dynamic> json, User_Model user) {
    name = json['name'];
  }
}
