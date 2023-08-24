import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/input.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAccountPage(),
      routes: {
        '/input': (context) => InputScreen(), // InputScreen을 '/input' 경로로 등록
      },
    );
  }
}

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/input/logo.svg',
                width: 39,
                height: 28,
              ),
              SizedBox(width: 10),
              Text(
                'COMMUYNITY',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'moebiusBold',
                  color: Color(0xff000203),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xffF1F2F6), // AppBar 배경색 투명하게 설정
          elevation: 0,
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/album/plus.svg',
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/input'); // '/input' 경로로 이동
              },
            ),
          ], // AppBar의 그림자 효과 제거
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
                            'Master',
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
                            '프리스타일 - Y',
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
                            '게시물: 4',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 14,
                              fontFamily: 'moebiusRegular',
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            '방문자수: 100',
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 14,
                              fontFamily: 'moebiusRegular',
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            '일촌: 50',
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
                          '친구 $index',
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
              tabs: [
                Tab(text: 'My Story'),
                Tab(text: 'My Album'),
              ],
            ),
            Divider(),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 4,
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
                                      'assets/images/complete/img$index.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/album/acorn.svg',
                                ),
                                SizedBox(width: 12.0),
                                SvgPicture.asset(
                                  'assets/icons/album/chat.svg',
                                ),
                                SizedBox(width: 12.0),
                                SvgPicture.asset(
                                  'assets/icons/album/send.svg',
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Liked by 100 people',
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 14,
                                fontFamily: 'moebiusRegular',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Caption goes here',
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 14,
                                fontFamily: 'moebiusRegular',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'View all 20 comments',
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 12,
                                fontFamily: 'moebiusRegular',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '2 hours ago',
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
                                'assets/images/complete/img$index.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: 4, // 이미지 개수 설정
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
