import 'package:code4odisha/screens/QrView.dart';
import 'package:code4odisha/screens/activity.dart';
import 'package:code4odisha/screens/dashboard.dart';
import 'package:code4odisha/screens/help.dart';
import 'package:code4odisha/screens/login.dart';
import 'package:code4odisha/screens/timer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class navigate extends StatefulWidget {
  const navigate({super.key});

  @override
  State<navigate> createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  List pages = [const progression(), Status(), Dashboard(), QrCode(), Help()];
  int currentIndex = 2;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(
          'images/Code4Odisha.svg',
          height: 30,
        ),
        backgroundColor: Color.fromRGBO(16, 15, 15, 1),
        title: const Text(
          'Code4Odisha',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('password').whenComplete(() => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    ),
                  });
            },
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          color: const Color.fromRGBO(239, 91, 12, 1),
          index: currentIndex,
          onTap: onTap,
          height: 50.0,
          items: const <Widget>[
            Icon(Icons.track_changes, size: 30, color: Colors.green),
            Icon(Icons.notifications_active, size: 30, color: Colors.white),
            Icon(Icons.home, size: 30, color: Colors.blue),
            Icon(Icons.qr_code, size: 30, color: Colors.white),
            Icon(Icons.question_mark, size: 30, color: Colors.black),
          ]),
    );
  }
}
