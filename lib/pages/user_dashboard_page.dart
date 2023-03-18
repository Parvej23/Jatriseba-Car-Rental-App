import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_app/pages/login_email_page.dart';
import 'package:rent_car_app/pages/login_phone_page.dart';
import 'package:rent_car_app/pages/signin_option_page.dart';
import 'package:rent_car_app/providers/user_provider.dart';
import 'package:rent_car_app/utils/helper_functions.dart';

class UserDashboardPage extends StatefulWidget {
  static const String routeName = '/userDashboard';

  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  late String loginOption;
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    loginOption = argList[0];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //add appbar
            title: Text("Dashboard"),
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
                  /*Navigator.pushReplacementNamed(
                      context, UserDashboardPage.routeName);*/
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
