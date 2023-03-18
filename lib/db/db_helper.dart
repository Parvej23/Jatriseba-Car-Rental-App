import 'package:rent_car_app/models/admin_model.dart';
import 'package:rent_car_app/models/car_model.dart';
import 'package:rent_car_app/models/driver_model.dart';
import 'package:rent_car_app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DbHelper {
  static const String createTableAdmin = '''create table $tblAdmin(
  $tblAdminColId integer primary key autoincrement,
  $tblAdminColName text,
  $tblAdminColPassword text,
  $tblAdminColMobileNo text,
  $tblAdminColEmail text,
  $tblAdminColEntryUser text,
  $tblAdminColEntryDate text,
  $tblAdminColIsSuperAdmin integer,
  $tblAdminColIsLoggedIn integer,
  $tblAdminColLoginTime text,
  $tblAdminColLogoutTime text)''';

  static const String createTableUser = '''create table $tblUser(
  $tblUserColId integer primary key autoincrement,
  $tblUserColName text,
  $tblUserColPassword text,
  $tblUserColMobileNo text,
  $tblUserColEmail text,
  $tblUserColAddress text,
  $tblUserColStatus text,
  $tblUserColImage text,
  $tblUserColIsLoggedIn integer,
  $tblUserColLoginTime text,
  $tblUserColLogoutTime text)''';

  static const String createTableCar = '''create table $tblCar(
  $tblCarColId integer primary key autoincrement,
  $tblCarColCarModel text,
  $tblCarColBrand text,
  $tblCarColDes text,
  $tblCarColSeatNo integer,
  $tblCarColImage text,
  $tblCarColEntryUser text,
  $tblCarColEntryDate text)''';

  static const String createTableDriver = '''create table $tblDriver(
  $tblDriverColId integer primary key autoincrement,
  $tblDriverColName text,
  $tblDriverColAddress text,
  $tblDriverColEmail text,
  $tblDriverColNID text,
  $tblDriverColMobileNo text,
  $tblDriverColEntryUser text,
  $tblDriverColEntryDate)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'rentcar_db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(createTableAdmin);
      await db.execute(createTableUser);
      await db.execute(createTableCar);
      await db.execute(createTableDriver);
      /*await db.execute(createTableRating);
      await db.execute(createTableFavorite);*/
    }/*, onUpgrade: (db, oldVersion, newVersion) async {
      if (newVersion == 2) {

        await db.execute('ALTER TABLE $tblAdmin RENAME COLUMN admin TO isSuperAdmin');
        await db.execute('ALTER TABLE $tblCar MODIFY brand text');
      }
      *//*else if(newVersion == 3){
        await db.execute('alter table $tblCar add column $tblCarColImage text');
        await db.execute('ALTER TABLE $tblCar MODIFY brand text');
      }
      else if(newVersion == 4){
        await db.execute('ALTER TABLE $tblCar RENAME COLUMN brandId TO brand');
        await db.execute('ALTER TABLE $tblCar MODIFY brand text');
      }
      else if(newVersion == 5){
        await db.execute('ALTER TABLE $tblCar MODIFY brand text');
      }*//*
    }*/);
  }

  /*static Future<int> insertAdmin(AdminModel adminModel) async {
    final db = await open();
    return db.insert(tblAdmin, adminModel.toMap());
  }*/

  static Future<int> insertCar(CarModel carModel) async {
    final db = await open();
    return db.insert(tblCar, carModel.toMap());
  }

  static Future<int> updateCar(CarModel carModel) async {
    final db = await open();
    return db.update(tblCar, carModel.toMap(),
      where: '$tblCarColId = ?', whereArgs: [carModel.carId],);
  }

  static Future<List<CarModel>> getAllCars() async {
    final db = await open();
    final mapList = await db.query(tblCar);
    return List.generate(mapList.length, (index) =>
        CarModel.fromMap(mapList[index]));
  }

  static Future<int> deleteCar(int carId) async {
    final db = await open();
    return db.delete(tblCar,
      where: '$tblCarColId = ?', whereArgs: [carId],);
  }

  static Future<UserModel?> getUserByMobile(String mobile) async {
    final db = await open();
    final mapList = await db.query(
      tblUser,
      where: '$tblUserColMobileNo = ?',
      whereArgs: [mobile],
    );
    if (mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(
      tblUser,
      where: '$tblUserColEmail = ?',
      whereArgs: [email],
    );
    if (mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }

  static Future<AdminModel?> getAdminUserByMobile(String mobile) async {
    final db = await open();
    final mapList = await db.query(
      tblUser,
      where: '$tblAdminColMobileNo = ?',
      whereArgs: [mobile],
    );
    if (mapList.isEmpty) return null;
    return AdminModel.fromMap(mapList.first);
  }

  static Future<AdminModel?> getAdminUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(
      tblAdmin,
      where: '$tblAdminColEmail = ?',
      whereArgs: [email],
    );
    if (mapList.isEmpty) return null;
    return AdminModel.fromMap(mapList.first);
  }
}
