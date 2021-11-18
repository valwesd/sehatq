import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatq/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehatq/provider/google_sign_in_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/logins.png'),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: mSecondaryTextColor,
                      minimumSize: Size(300, 40),
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/google.svg',
                      height: 25,
                      alignment: Alignment.centerLeft,
                    ),
                    label: Text('Login Dengan Google')),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: mSecondaryTextColor,
                      minimumSize: Size(300, 40),
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/facebook.svg',
                      height: 25,
                      alignment: Alignment.centerLeft,
                    ),
                    label: Text('Login Dengan Facebook')),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: mSecondaryTextColor,
                      minimumSize: Size(300, 40),
                    ),
                    icon: Image.asset(
                      'assets/images/mail.png',
                      height: 15,
                    ),
                    label: Text('Login Dengan Email lain')),
              ],
            ),
          ),
        ));
  }
}
