import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/input3.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAccountPage3(),
    );
  }
}

class MyAccountPage3 extends StatefulWidget {
  @override
  _MyAccountPage3State createState() => _MyAccountPage3State();
}

class _MyAccountPage3State extends State<MyAccountPage3> {
  Color acornIconColor = Colors.black;
  Color chatIconColor = Colors.black;
  Color sendIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text(
                'My World',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'moebiusBold',
                  color: Color(0xff000203),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xffF1F2F6),
          elevation: 0,
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/album/plus.svg',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputScreen3()),
                );
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/album/message.svg',
              ),
              onPressed: () {
                // 메시지 아이콘을 터치했을 때 실행될 동작 추가
                // 예를 들어 메시지 창을 열거나 다른 페이지로 이동할 수 있음
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        AssetImage('assets/images/friend/master.png'),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '임승환',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 20,
                              fontFamily: 'moebiusRegular',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.music_note,
                            color: Color(0xff3B4866),
                          ),
                          // 음악 아이콘 추가
                          SizedBox(width: 3),
                          Text(
                            '아이브 - LOVE DIVE',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 12,
                              fontFamily: 'moebiusRegular',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Life is art',
                        style: TextStyle(
                          color: Color(0xff3B4866),
                          fontSize: 18,
                          fontFamily: 'moebiusRegular',
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            '캔버스 6',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 14,
                              fontFamily: 'moebiusRegular',
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            'Today 100',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 14,
                              fontFamily: 'moebiusRegular',
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            '일촌 100',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 14,
                              fontFamily: 'moebiusRegular',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    width: 80.0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              AssetImage('assets/images/friend/img$index.png'),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '이웃 $index',
                          style: TextStyle(
                            color: Color(0xff3B4866),
                            fontSize: 12,
                            fontFamily: 'moebiusRegular',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            TabBar(
              labelColor: Color(0xff3B4866),
              labelStyle: TextStyle(fontFamily: 'moebiusRegular'),
              indicatorColor: Color(0xff727DBC),
              tabs: [
                Tab(text: 'My Canvas'),
                Tab(text: 'My Album'),
              ],
            ),
            Divider(),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 300.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/complete4/img$index.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      acornIconColor = Colors.brown;
                                      chatIconColor = Colors.black;
                                      sendIconColor = Colors.black;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/album/acorn.svg',
                                    color: acornIconColor,
                                  ),
                                ),
                                SizedBox(width: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      acornIconColor = Colors.black;
                                      chatIconColor = Color(0xff727DBC);
                                      sendIconColor = Colors.black;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/album/chat.svg',
                                    color: chatIconColor,
                                  ),
                                ),
                                SizedBox(width: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      acornIconColor = Colors.black;
                                      chatIconColor = Colors.black;
                                      sendIconColor = Color(0xff727DBC);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/album/send.svg',
                                    color: sendIconColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'SKT FLY AI',
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 18,
                                fontFamily: 'moebiusBold',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '드디어 대망의 SKT FLY AI가 성공적으로 마무리가 되었고 우리는 대상을... more',
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 14,
                                fontFamily: 'moebiusRegular',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '강연수 : 다들 너무 고생했어 진짜 너무 축하해',
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 12,
                                fontFamily: 'moebiusBold',
                              ),
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/complete4/img$index.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: 6, // 이미지 개수 설정
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffF2F3F8), // Scaffold 배경색 설정
      ),
    );
  }
}
