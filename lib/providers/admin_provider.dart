import 'package:flutter/material.dart';
import 'package:rent_car_app/db/db_helper.dart';
import 'package:rent_car_app/models/admin_model.dart';

class AdminProvider extends ChangeNotifier {
  late AdminModel adminModel;

  Future<AdminModel?> getAdminUserByMobile(String mobile) =>
      DbHelper.getAdminUserByMobile(mobile);

  Future<AdminModel?> getAdminUserByEmail(String email) =>
      DbHelper.getAdminUserByEmail(email);

}