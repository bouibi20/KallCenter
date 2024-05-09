class User_Model {

  late String? email;


  late String? Password;


  late String? name;


  late String? token;


  User_Model(this.email, this.token);


  User_Model.fromJson(Map<String, dynamic> json) {

    email = json['email'];


    name = json['name'];


    token = json['token'];

  }


  User_Model.fromJsonUpdate(Map<String, dynamic> json, User_Model user) {

    email = json['email'];


    name = json['name'];


    token = json['token'];

  }


  Map<String, dynamic> toJson() {

    return {

      'email': email,

      'password': Password,

    };

  }

}

