import 'dart:async';
import 'package:code4odisha/buttons/navigate.dart';
import 'package:code4odisha/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalpass;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 1), () {
        if (finalpass == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const navigate(),
            ),
          );
        }
      });
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var pass = sharedPreferences.getString('password');
    setState(() {
      finalpass = pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
