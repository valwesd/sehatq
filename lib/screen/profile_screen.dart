import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/provider/google_sign_in_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mPrimaryColor,
          title: Text("Profil"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/homePage');
            },
          ),
          actions: [
            TextButton(
                child: Text('Logout'),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                })
          ],
        ),
        body: Center(
          child: Text('logout'),
        ));
  }
}
