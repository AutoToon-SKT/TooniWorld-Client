import 'package:flutter/material.dart';
import 'dart:async';
import 'package:SKT_FLY_AI/screen/show_cartoon.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _disposed = false;

  @override
  void initState() {
    super.initState();

    // 5초 후에 show_cartoon.dart로 이동
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ShowCartoonScreen()),
      );
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash/loading_splash.png'),
            alignment: Alignment.center,
            fit: BoxFit.none,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 123),
            SizedBox(
              height: 130.0,
              width: 130.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff727DBC)),
                strokeWidth: 8,
              ),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '만화 생성중',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff3B4866),
                    fontFamily: 'moebiusBold',
                  ),
                ),
                SizedBox(width: 10),
                LoadingDots(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingDots extends StatefulWidget {
  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> {
  bool isMovingUp1 = true;
  bool isMovingUp2 = false;
  bool isMovingUp3 = true;

  late Timer _timer; // Add this line

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (!mounted) {
        // Check if the widget is still mounted before updating the state
        return;
      }
      setState(() {
        isMovingUp1 = !isMovingUp1;
        isMovingUp2 = !isMovingUp2;
        isMovingUp3 = !isMovingUp3;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Transform.translate(
          offset: isMovingUp1 ? Offset(0, -3) : Offset(0, 3),
          child: Text(
            '●',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xff3B4866),
              fontFamily: 'moebiusRegular',
            ),
          ),
        ),
        SizedBox(width: 5),
        Transform.translate(
          offset: isMovingUp2 ? Offset(0, -3) : Offset(0, 3),
          child: Text(
            '●',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xff3B4866),
              fontFamily: 'moebiusRegular',
            ),
          ),
        ),
        SizedBox(width: 5),
        Transform.translate(
          offset: isMovingUp3 ? Offset(0, -3) : Offset(0, 3),
          child: Text(
            '●',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xff3B4866),
              fontFamily: 'moebiusRegular',
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Animation',
      home: LoadingScreen(),
    );
  }
}
