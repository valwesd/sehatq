import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/screen/home_screen.dart';
import 'package:sehatq/screen/login_screen.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            }),
      );
}
