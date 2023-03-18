const String tblDriver = 'tblDriver';
const String tblDriverColId = 'driverId';
const String tblDriverColName = 'name';
const String tblDriverColAddress = 'address';
const String tblDriverColEmail = 'email';
const String tblDriverColNID = 'nid';
const String tblDriverColMobileNo = 'seatNo';
const String tblDriverColEntryUser = 'entryUser';
const String tblDriverColEntryDate = 'entryDate';

class DriverModel {
  int? driverId;
  String name;
  String address;
  String mobileNo;
  String? email;
  String nid;
  String? entryUser;
  String? entryDate;

  DriverModel(
      {this.driverId,
      required this.name,
      required this.address,
      required this.mobileNo,
      this.email,
      required this.nid,
      this.entryUser,
      this.entryDate});

  factory DriverModel.fromMap(Map<String, dynamic> map) => DriverModel(
        driverId: map[tblDriverColId],
        name: map[tblDriverColName],
        address: map[tblDriverColAddress],
        email: map[tblDriverColEmail],
        nid: map[tblDriverColNID],
        mobileNo: map[tblDriverColMobileNo],
        entryUser: map[tblDriverColEntryUser],
        entryDate: map[tblDriverColEntryDate],
      );
}
