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
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.black,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => SplashScreenWrapper(),
        '/input': (context) => InputScreen(),
        '/subsplash': (context) => SubSplashScreen(),
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
    Future.delayed(Duration(seconds: 1), () {
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
            Container(
              child: Center(
                child: Text(
                  '홈화면',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'moebiusRegular',
                  ),
                ),
              ),
            ),
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
