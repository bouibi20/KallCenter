// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:kallcenter/Core/Class/StatusRequest.dart';
import 'package:kallcenter/Core/Constante/Api_Links.dart';
import 'package:kallcenter/Core/Function/CheckInternet.dart';
import 'package:kallcenter/Data/Repository/User.dart';
import 'package:kallcenter/Data/model/Strore.dart';
import 'package:kallcenter/Data/model/User.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UserAPI extends User_Repository {
  var headers = {'Accept': 'application/json'};

  @override
  Future<Either<StatusRequest, User_Model?>> Login(
      String email, String password) async {
    var body = {'email': email, 'password': password};
    try {
      if (await CheckInternet()) {
        var response = await http.post(Uri.parse("${urlAPI}/login"),
            headers: {'Accept': 'application/json'}, body: body);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 401) {
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

          if (jsonResponse['access_token'] != null) {
            // if (1 == 1) {
            //   if (email == "email@gmail.com" && password == "00000000") {
            print("login seccess");
            User_Model users = User_Model.fromJson(jsonResponse);

            // User_Model users = User_Model(
            //     email,
            //     "folan fartalan",
            //     "https://www.shutterstock.com/image-photo/midway-view-agadir-oufla-climb-600nw-2318978819.jpg",
            //     Store_Model.fromJsontolist([
            //       {"id": 1, "name": "store test11"},
            //       {"id": 2, "name": "store test 2"},
            //       {"id": 3, "name": "store test 3"},
            //     ]),
            //     "token_yufyfzelugzeflzefl");

            return right(users);
          } else {
            print("Username or Password Invalid");
            return left(StatusRequest.failure);
          }
        } else {
          return left(StatusRequest.serveurfailure);
        }
      } else {
        return left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("you hane an error: $e");
      return left(StatusRequest.offlinefailure);
    }
  }

  /// had request hia bach kay idir payment lawal
  // @override
  // Future<Either<StatusRequest, dynamic>> Payment(
  //     User_Model users, int idPlant, double prix, File image) async {
  //   try {
  //     if (await CheckInternet()) {
  //       var data = {
  //         'plan_id': idPlant,
  //         "payed_amount": prix,
  //       };
  //       var request =
  //           http.MultipartRequest('post', Uri.parse('$urlAPI/firstpayment'));
  //       // Set the headers
  //       request.headers.addAll({
  //         'Accept': 'application/json',
  //         'Authorization': users.token!,
  //       });
  //       var lenght = await image.length();
  //       var stream = http.ByteStream(image.openRead());
  //       var multipartFile = http.MultipartFile("photo", stream, lenght,
  //           filename: basename(image.path));
  //       request.files.add(multipartFile);
  //       data.forEach((key, value) {
  //         request.fields[key] = value.toString();
  //       });
  //       var myRequest = await request.send();
  //       var response = await http.Response.fromStream(myRequest);
  //       var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         // User_Model member = User_Model.fromJsonUpdate(jsonResponse, users);
  //         return right(jsonResponse);
  //       } else {
  //         return left(StatusRequest.serveurfailure);
  //       }
  //     } else {
  //       return left(StatusRequest.offlinefailure);
  //     }
  //   } catch (e) {
  //     print("you hane an error: $e");
  //     return left(StatusRequest.offlinefailure);
  //   }
  // }

  // @override
  // Future<Either<StatusRequest, dynamic>> CheckStatus(User_Model users) async {
  //   try {
  //     if (await CheckInternet()) {
  //       var response =
  //           await http.post(Uri.parse("${urlAPI}/getdatauser"), headers: {
  //         'Accept': 'application/json',
  //         'Authorization': users.token!,
  //       });
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  //         users = User_Model.fromJsonUpdate(jsonResponse, users);
  //         return right(users);
  //       } else {
  //         return left(StatusRequest.serveurfailure);
  //       }
  //     } else {
  //       return left(StatusRequest.offlinefailure);
  //     }
  //   } catch (e) {
  //     print("you hane an error: $e");
  //     return left(StatusRequest.offlinefailure);
  //   }
  // }
}
