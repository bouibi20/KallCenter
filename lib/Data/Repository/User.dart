// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kallcenter/Core/Class/StatusRequest.dart';
import 'package:kallcenter/Data/model/User.dart';

abstract class User_Repository {
  Future<Either<StatusRequest, dynamic>> Login(
      String username, String password);
  Future<Either<StatusRequest, dynamic>> CheckStatus(User_Model User);
  Future<Either<StatusRequest, dynamic>> Payment(
      User_Model User, int idPlant, double prix, File image);
}
