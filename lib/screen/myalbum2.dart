import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/input2.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAccountPage2(),
    );
  }
}

class MyAccountPage2 extends StatefulWidget {
  @override
  _MyAccountPage2State createState() => _MyAccountPage2State();
}

class _MyAccountPage2State extends State<MyAccountPage2> {
  Color acornIconColor = Colors.black;
  Color chatIconColor = Colors.black;
  Color sendIconColor = Colors.black;
  List<Map<String, dynamic>> imageData = [
    {
      'imagePath': 'assets/images/complete/img0.png',
      'title': '그랜드 캐니언 탐방기',
      'description':
          '오늘은 꿈에 그리던 여행, 미국 그랜드 캐니언에서 일출을 바라보는 날이다. 아침 일찍 출발하여 버스를 타고 그랜드캐니언으로 more... ',
      'comment': '이건희 : 와 진짜 노을 뭔데 너무 대박인데 나도가보고 싶어!!',
    },
    {
      'imagePath': 'assets/images/complete/img1.png',
      'title': '즐거운 기차 여행',
      'description': '오늘은 즐거운 기차여행 날이다 친구들이랑 간단하게 점심을 먹고 커피를 사들고 more... ',
      'comment': '이승호 : 엄청 재미있겠다 나중에 나도 기회되면 가고 싶어ㅠㅠ',
    },
    {
      'imagePath': 'assets/images/complete/img2.png',
      'title': '제일 친한 친구 함께 찍은 사진 한 컷',
      'description': '오랜만에 초등학교때 이사를 간 친구가 보고 싶었는데 사진이 없어서 아쉬웠다. more... ',
      'comment': '강연수 : 뭐야 엄청 닮았어 대박대박',
    },
    {
      'imagePath': 'assets/images/complete/img3.png',
      'title': '사촌동생과 함께 떠나는 바다 여행',
      'description': '사촌동생이랑 배를 타고 저 멀리 있는 섬에 놀러가는 날이다. 바다 바람은 more... ',
      'comment': '오정민 : 어디 섬으로 간거야 나도 나중에 한 번 가볼래!',
    },
    {
      'imagePath': 'assets/images/complete/img4.png',
      'title': '즐거운 저녁시간 기다려지는 BBQ 파티',
      'description': '즐거운 저녁시간이다 오랜만에 보고 싶었던 가족과 친적들과 함께 야외에서 BBQ를 즐겼 more... ',
      'comment': '임승환 : 다음에 저도 꼭 참여할게요!',
    },
    // 나머지 이미지들에 대한 정보도 추가해주세요
  ];
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
                // '투니월드로 가기' 버튼을 눌렀을 때의 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputScreen2(),
                  ),
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
                            '캔버스 5',
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
                    itemCount: imageData.length,
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
                                  image:
                                      AssetImage(imageData[index]['imagePath']),
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
                              imageData[index]['title'],
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 18,
                                fontFamily: 'moebiusBold',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              imageData[index]['description'],
                              style: TextStyle(
                                color: Color(0xff3B4866),
                                fontSize: 14,
                                fontFamily: 'moebiusRegular',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              imageData[index]['comment'],
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
                                'assets/images/complete/img$index.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: 5, // 이미지 개수 설정
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffF2F3F8),
      ),
    );
  }
}
