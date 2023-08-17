import 'package:SKT_FLY_AI/screen/choice.dart';
import 'package:SKT_FLY_AI/screen/diary.dart';
import 'package:SKT_FLY_AI/screen/homescreen.dart';
import 'package:SKT_FLY_AI/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/menu_screen.dart';
import 'package:SKT_FLY_AI/sub_splash_screen.dart';
import 'package:SKT_FLY_AI/splash_screen.dart';
import 'package:SKT_FLY_AI/screen/input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '투니닷',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF1F2F6),
        brightness: Brightness.light,
        primaryColor: Colors.black,
        hintColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff727DBC)), // 포커스 받을 때 테두리 색상
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD9D9D9)), // 평소 테두리 색상
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreenWrapper(),
        '/input': (context) => InputScreen(),
        '/subsplash': (context) => SubSplashScreen(),
        '/choice': (context) => ChoiceScreen(),
        '/diary': (context) => DiaryScreen(),
      },
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  _loadSplash() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ADotHomeScreen(),
            Container(
              child: Center(),
            ),
            Container(
              child: Center(),
            ),
            Container(
              child: Center(),
            ),
            MenuScreen(),
          ],
        ),
        bottomNavigationBar: Bottom(),
      ),
    );
  }
}
