import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/provider/google_sign_in_provider.dart';
import 'package:sehatq/screen/beli_obat.dart';

import 'package:sehatq/screen/buat_janji.dart';
import 'package:sehatq/screen/daftar_tanyadok.dart';
import 'package:sehatq/screen/home_screen.dart';

import 'package:sehatq/screen/login_screen.dart';
import 'package:sehatq/screen/tanya_dokter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'SehatQ',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: mBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginScreen(),
          initialRoute: '/homePage',
          routes: {
            '/homePage': (context) => HomeScreen(),
            '/tanyaDok': (context) => TanyaDokter(),
            '/beliObat': (context) => BeliObat(),
            '/buatJanji': (context) => BuatJanji(),

            '/tanyagratis': (context) => TanyaGratis(),
            //'/artikelPage': (context)=> HomeScreen(),
          },
        ),
      );
}
