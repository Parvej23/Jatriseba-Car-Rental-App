import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_app/models/admin_model.dart';
import 'package:rent_car_app/pages/add_car_page.dart';
import 'package:rent_car_app/pages/signin_option_page.dart';
import 'package:rent_car_app/providers/admin_provider.dart';
import 'package:rent_car_app/utils/helper_functions.dart';

class AdminDashboardPage extends StatefulWidget {
  static const String routeName = '/adminDashboard';

  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  late AdminProvider adminProvider;
  late AdminModel adminModel;

  @override
  void didChangeDependencies() {
    adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    if (argList != null) {
      adminModel = argList[0];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //add appbar
            title: Text('Dashboard'),
            actions: [
              IconButton(
                onPressed: () async {
                  await setLoginStatus(false);
                  Navigator.pushReplacementNamed(
                      context, SigninOptionPage.routeName);
                },
                icon: const Icon(Icons.logout),
              )
            ]),
        drawer: Drawer(
          child: SafeArea(
              child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text("Home Page"),
                leading: Icon(Icons.home),
                onTap: () {
                  //action when this menu is pressed
                },
              ),
              ListTile(
                dense: true,
                title: Text("Add Car"),
                leading: Icon(Icons.car_rental),
                onTap: () {
                  Navigator.pushReplacementNamed(context, AddCarPage.routeName,
                      arguments: [adminModel]);
                  //action when this menu is pressed
                },
              ),
              ListTile(
                dense: true,
                title: Text("Add Driver"),
                leading: Icon(Icons.person_add),
                onTap: () {
                  //action when this menu is pressed
                },
              ),
              ListTile(
                dense: true,
                title: Text("Add Fare"),
                leading: Icon(Icons.money),
                onTap: () {
                  //action when this menu is pressed
                },
              ),
              ListTile(
                dense: true,
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () async {
                  await setLoginStatus(false);
                  Navigator.pushReplacementNamed(
                      context, SigninOptionPage.routeName);
                },
              )
            ],
          )),
        ) //add drawer
        //when you add drawer, the menu icon will appear on appbar
        );
  }
}
