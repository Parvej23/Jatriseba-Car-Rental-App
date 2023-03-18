import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_app/pages/add_car_page.dart';
import 'package:rent_car_app/pages/add_driver_page.dart';
import 'package:rent_car_app/pages/admin_dashboard_page.dart';
import 'package:rent_car_app/pages/admin_login_page.dart';
import 'package:rent_car_app/pages/car_details_page.dart';
import 'package:rent_car_app/pages/driver_details_page.dart';
import 'package:rent_car_app/pages/launcher_page.dart';
import 'package:rent_car_app/pages/login_email_page.dart';
import 'package:rent_car_app/pages/login_phone_page.dart';
import 'package:rent_car_app/pages/otp_verification_page.dart';
import 'package:rent_car_app/pages/signin_option_page.dart';
import 'package:rent_car_app/pages/user_dashboard_page.dart';
import 'package:rent_car_app/providers/admin_provider.dart';
import 'package:rent_car_app/providers/car_provider.dart';
import 'package:rent_car_app/providers/fare_provider.dart';
import 'package:rent_car_app/providers/user_provider.dart';
import 'package:rent_car_app/screens/cars_overview.dart';

import 'providers/driver_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AdminProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => CarProvider()),
    ChangeNotifierProvider(create: (context) => DriverProvider()),
    ChangeNotifierProvider(create: (context) => FareProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent a Car',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SigninOptionPage.routeName,
      routes: {
        SigninOptionPage.routeName: (context) => SigninOptionPage(),
        LoginPhonePage.routeName: (context) => LoginPhonePage(),
        LoginEmailPage.routeName: (context) => LoginEmailPage(),
        OtpVerificationPage.routeName: (context) => OtpVerificationPage(),
        UserDashboardPage.routeName: (context) => UserDashboardPage(),
        AdminDashboardPage.routeName: (context) => AdminDashboardPage(),
        AdminLoginPage.routeName: (context) => AdminLoginPage(),
        CarDetailsPage.routeName: (context) => CarDetailsPage(),
        AddCarPage.routeName: (context) => AddCarPage(),
        DriverDetailsPage.routeName: (context) => DriverDetailsPage(),
        AddDriverPage.routeName: (context) => AddDriverPage(),
        CarsOverviewScreen.routeName:(context)=>CarsOverviewScreen()
      },
    );
  }
}
