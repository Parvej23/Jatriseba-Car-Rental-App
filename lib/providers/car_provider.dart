import 'package:flutter/material.dart';
import 'package:rent_car_app/db/db_helper.dart';
import 'package:rent_car_app/models/car_model.dart';

class CarProvider extends ChangeNotifier {
  late CarModel carModel;

  Future<int> insertCar(CarModel carModel) => DbHelper.insertCar(carModel);

  Future<int> updateCar(CarModel carModel) => DbHelper.updateCar(carModel);

  Future<List<CarModel>> getAllCars() => DbHelper.getAllCars();

  Future<int> deleteCar(int carId) => DbHelper.deleteCar(carId);
}
