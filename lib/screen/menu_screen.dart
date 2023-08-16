import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SKT_FLY_AI/sub_splash_screen.dart'; // Import SubSplashScreen

class MenuScreen extends StatefulWidget {
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF1F2F6),
        title: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'moebiusBold',
            color: Color(0xff101010),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle first icon button press
            },
            icon: SvgPicture.asset(
              'assets/icons/menu/bell.svg',
            ),
          ),
          IconButton(
            onPressed: () {
              // Handle second icon button press
            },
            icon: SvgPicture.asset(
              'assets/icons/menu/setting.svg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 58, 16, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '즐거움이 가득한 콘텐츠',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'moebiusBold',
                      color: Color(0xff101010),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(
                      text: 'TV',
                      additionalText: '무엇을 볼까? 고민 해결',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/TV.svg',
                      ),
                    ),
                    SizedBox(height: 9),
                    ButtonWidget(
                      text: '음악추천',
                      additionalText: '지금을 채워줄 나만의 음악',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/music.svg',
                      ),
                    ),
                    SizedBox(height: 9),
                    ButtonWidget(
                      text: '프로야구',
                      additionalText: '똑똑한 AI 야구 중계',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/baseball.svg',
                      ),
                    ),
                    SizedBox(height: 9),
                    ButtonWidget(
                      text: '게임',
                      additionalText: '지금 바로 실력 뽐내보기',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/game.svg',
                      ),
                    ),
                    SizedBox(height: 9),
                    ButtonWidget(
                      text: '타로',
                      additionalText: '인생 고민 타로로 해결',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/life.svg',
                      ),
                    ),
                    SizedBox(height: 9),
                    ButtonWidget(
                      text: '심리테스트',
                      additionalText: '나도 몰랐던 나의 발견',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/card.svg',
                      ),
                    ),
                    SizedBox(height: 9),
                    ButtonWidget(
                      text: '투니닷',
                      additionalText: '나의 일상을 AI가 카툰으로 그려주기',
                      icon: SvgPicture.asset(
                        'assets/icons/menu/toon.svg',
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final String additionalText;
  final Widget icon;

  const ButtonWidget({
    required this.text,
    required this.additionalText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == '투니닷') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SubSplashScreen()), // Navigate to SubSplashScreen
          );
        } else {
          // Handle other buttons
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xff3B4866),
        minimumSize: Size(368, 79),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: icon,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                  color: Color(0xff3B4866),
                ),
              ),
              SizedBox(height: 4),
              Text(
                additionalText,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'moebiusRegular',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
