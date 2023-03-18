import 'package:flutter/material.dart';
import 'package:rent_car_app/pages/admin_login_page.dart';
import 'package:rent_car_app/pages/login_email_page.dart';
import 'package:rent_car_app/pages/login_phone_page.dart';
import 'package:rent_car_app/screens/cars_overview.dart';

class SigninOptionPage extends StatefulWidget {
  static const String routeName = '/signinOption';

  const SigninOptionPage({Key? key}) : super(key: key);

  @override
  State<SigninOptionPage> createState() => _SigninOptionPageState();
}

class _SigninOptionPageState extends State<SigninOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/signin_option.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'Jatri Sheba',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              const Text('''Hire reliable service experts for
               your home & office''',
                  style: TextStyle(
                    color: Color(0xff4c505b),
                    fontSize: 18,
                  )),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff9F2B68)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginPhonePage.routeName);
                      },
                      icon: Icon(Icons.phone),
                      label: Text('Continue with Phone')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('or Connect with',
                  style: TextStyle(
                    color: Color(0xff4c505b),
                    fontSize: 18,
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff9F2B68)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginEmailPage.routeName);
                      },
                      icon: Icon(Icons.email),
                      label: Text('Continue with Email')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  //width: 400,
                  child: TextButton.icon(
                      /*style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xff9F2B68)),
                      ),*/
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AdminLoginPage.routeName);
                      },
                      icon: Icon(Icons.supervised_user_circle),
                      label: Text('Admin Login')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'By logging or registering, yor agree to our\n',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: <InlineSpan>[
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      //minimumSize: const Size(0, 0),
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    onPressed: () {},
                                    child: Text('Terms and Services'),
                                  )),
                              TextSpan(text: ' and '),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      //minimumSize: Size.zero,
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, CarsOverviewScreen.routeName);
                                    },
                                    child: Text('Privacy Policy'),
                                  )),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
