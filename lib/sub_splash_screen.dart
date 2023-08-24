import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/myalbum.dart';

class SubSplashScreen extends StatefulWidget {
  @override
  _SubSplashScreenState createState() => _SubSplashScreenState();
}

class _SubSplashScreenState extends State<SubSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToInputScreen();
  }

  _navigateToInputScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyAccountPage()), // MyAccountPage으로 이동
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash/toon_dot_main_splash.png',
      fit: BoxFit.cover,
    );
  }
}
