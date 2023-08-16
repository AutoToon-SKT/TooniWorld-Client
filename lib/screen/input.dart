import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int friendsCount = 0; // 초기 값 설정

  void increaseFriendsCount() {
    setState(() {
      friendsCount++;
    });
  }

  void decreaseFriendsCount() {
    setState(() {
      if (friendsCount > 0) {
        friendsCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(194.0),
        child: AppBar(
          backgroundColor: Color(0xffF1F2F6),
          elevation: 0,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 30.0),
              SvgPicture.asset(
                'assets/icons/input/logo.svg',
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffF1F2F6),
      body: Column(
        children: [
          SizedBox(height: 90), // Set spacing between AppBar and buttons
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 102,
                  width: 171.48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffE4E9FF),
                      onPrimary: Color(0xff3B4866),
                      minimumSize: Size(171.48, 102),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '나 혼자 참여하기',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'moebiusRegular'),
                        ),
                        SizedBox(height: 16),
                        SvgPicture.asset(
                          'assets/icons/input/adot_king.svg',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  height: 102,
                  width: 171.48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffE4E9FF),
                      onPrimary: Color(0xff3B4866),
                      minimumSize: Size(171.48, 102),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '친구와 같이 참여하기',
                          style: TextStyle(
                              fontSize: 14, fontFamily: 'moebiusRegular'),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: SvgPicture.asset(
                                  'assets/icons/input/mini.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: increaseFriendsCount,
                              child: Icon(Icons.add),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Color(0xff3B4866),
                                minimumSize: Size(10, 27),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '$friendsCount',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'moebiusBold',
                                color: Color(0xff3B4866),
                              ),
                            ),
                            SizedBox(width: 4),
                            ElevatedButton(
                              onPressed: decreaseFriendsCount,
                              child: Icon(Icons.remove),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Color(0xff3B4866),
                                minimumSize: Size(20, 27),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30), // Spacing between buttons and "참여하기" button
          SizedBox(
            width: 358,
            height: 51,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xff727DBC),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                '참여하기',
                style: TextStyle(fontSize: 18, fontFamily: 'moebiusRegular'),
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: Bottom(), // error reason
    );
  }
}
