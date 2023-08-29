import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SKT_FLY_AI/screen/myalbum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: ADotHomeScreen(),
    );
  }
}

class ADotHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(0xffB0DDFC),
          elevation: 0,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/home/adot.svg',
                      width: 37,
                      height: 28,
                    ),
                    SizedBox(height: 29),
                    Text(
                      '에이닷에 오신것을 환영합니다!',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'moebiusBold',
                        color: Color(0xff000203),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffB0DDFC),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 370,
                    height: 208,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 눌렀을 때의 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff50CCF2),
                        padding: EdgeInsets.only(left: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Row(
                        // ElevatedButton 내부에 Row를 추가하여 버튼과 아이콘을 나란히 배치
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '당신의 지루한 일상에 즐거운 시간',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'moebiusBold'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '만화 이미지로 바꿔바꿔',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'moebiusBold'),
                              ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {
                                  // '투니월드로 가기' 버튼을 눌렀을 때의 동작
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyAccountPage()), // MyAccountPage로 이동
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Color(0xff3B4866),
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text(
                                    '투니월드로 가기 >',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff3B4866),
                                        fontFamily: 'moebiusBold'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16), // 아이콘과 버튼 사이의 간격
                          SvgPicture.asset(
                            'assets/icons/input/paint.svg', // 사용하려는 SVG 아이콘 파일 경로
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  SizedBox(
                    width: 370,
                    height: 237,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 눌렀을 때의 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 흰색 배경색
                        padding: EdgeInsets.only(left: 20), // 왼쪽에 20px 여백 추가
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10), // 제목 위로 10px 여백
                          Text(
                            '시간대별 음악 추천',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'moebiusBold',
                              color: Color(0xff3B4866),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '당신의 시간을 사로잡을 특별한 음악 콘텐츠', // 첫 번째 컨테이너 설명
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff3B4866),
                              fontFamily: 'moebiusBold',
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                child: Image.asset(
                                    'assets/images/home/img1.png'), // 이미지 추가
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img2.jpg'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    'assets/images/home/img3.jpg'), // 두 번째 사진의 배경색
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // 컨테이너 사이 간격
                  SizedBox(
                    width: 370,
                    height: 237,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 눌렀을 때의 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 흰색 배경색
                        padding: EdgeInsets.only(left: 20), // 왼쪽에 20px 여백 추가
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10), // 제목 위로 10px 여백
                          Text(
                            '쉐도우 영상 영어',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'moebiusBold',
                              color: Color(0xff3B4866),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '본토 외국인 발음으로 만들어주기', // 첫 번째 컨테이너 설명
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff3B4866),
                              fontFamily: 'moebiusBold',
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    'assets/images/home/img4.png'), // 첫 번째 사진의 배경색
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    'assets/images/home/img5.png'), // 두 번째 사진의 배경색
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    'assets/images/home/img6.png'), // 두 번째 사진의 배경색
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 370,
                    height: 237,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 눌렀을 때의 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 흰색 배경색
                        padding: EdgeInsets.only(left: 20), // 왼쪽에 20px 여백 추가
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10), // 제목 위로 10px 여백
                          Text(
                            '오늘의 운세',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'moebiusBold',
                              color: Color(0xff3B4866),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '당신의 운세를 에이닷이 알려줄게요', // 첫 번째 컨테이너 설명
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff3B4866),
                              fontFamily: 'moebiusBold',
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img7.png'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img8.jpg'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img9.jpg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 370,
                    height: 237,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 눌렀을 때의 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 흰색 배경색
                        padding: EdgeInsets.only(left: 20), // 왼쪽에 20px 여백 추가
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10), // 제목 위로 10px 여백
                          Text(
                            '추천 영상',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'moebiusBold',
                              color: Color(0xff3B4866),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '시간이 순식간에 지나가는 매직', // 첫 번째 컨테이너 설명
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff3B4866),
                              fontFamily: 'moebiusBold',
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img10.png'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img11.jpg'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img12.jpg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 370,
                    height: 237,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼을 눌렀을 때의 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 흰색 배경색
                        padding: EdgeInsets.only(left: 20), // 왼쪽에 20px 여백 추가
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10), // 제목 위로 10px 여백
                          Text(
                            'AI 만화 필터',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'moebiusBold',
                              color: Color(0xff3B4866),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '당신의 얼굴을 만화주인공으로 변경', // 첫 번째 컨테이너 설명
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff3B4866),
                              fontFamily: 'moebiusBold',
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img13.jpg'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img14.jpg'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 100,
                                height: 100,
                                child:
                                    Image.asset('assets/images/home/img15.jpg'),
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
          ],
        ),
      ),
    );
  }
}
