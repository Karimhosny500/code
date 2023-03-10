import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_skate/common/theme.dart';

import 'package:final_skate/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      //final user = FirebaseAuth.instance.currentUser!;
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushNamed(context, RoutesName.login);
        } else {
          Navigator.pushNamed(context, RoutesName.home);
        }
      });
    });

    return const Scaffold(
        body: SpinKitDoubleBounce(
      color: canvasColor,
      size: 70.0,
    ));
  }
}
