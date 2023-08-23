import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SKT_FLY_AI/screen/choice.dart';

class CartoonResultScreen extends StatefulWidget {
  final List<int> selectedImageIndicesList;

  CartoonResultScreen({required this.selectedImageIndicesList});

  @override
  _CartoonResultScreenState createState() => _CartoonResultScreenState();
}

class _CartoonResultScreenState extends State<CartoonResultScreen> {
  int currentPageIndex = 0;
  late PageController _pageController;

  // 이미지에 대한 설명 리스트
  List<String> imageDescriptions = [
    '아침에 가족 모두 모여서 계획을 세운다...',
    '차 안에서의 여행은 웃음 가득하다...',
    '목적지에 도착하면 모두 들떠있다...',
    '일몰 시간이 다가오면 가족 모두 함께 해가 떨어지는 풍경을 바라본다...',
    //
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    currentPageIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105.0),
        child: AppBar(
          backgroundColor: Color(0xffF1F2F6),
          elevation: 0,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 28.0),
              SvgPicture.asset(
                'assets/icons/input/logo.svg',
                height: 100,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffF1F2F6),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                '당신의 만화를 소개합니다!',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 28,
                  fontFamily: 'moebiusRegular',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 450,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.selectedImageIndicesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showImageDescription(context, index),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              currentPageIndex == index
                                  ? Colors.transparent
                                  : Colors.grey,
                              BlendMode.saturation,
                            ),
                            child: Image.asset(
                              'assets/images/complete/img${widget.selectedImageIndicesList[index]}.png',
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0;
                      i < widget.selectedImageIndicesList.length;
                      i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            currentPageIndex == i ? Colors.purple : Colors.grey,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: 368,
                height: 51,
                child: ElevatedButton(
                  onPressed: () {
                    // Your code for the third button
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff727DBC),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    '커뮤니티 공유',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'moebiusRegular',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageDescription(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              '\u{1F4D6} CUT STORY \u{1F4D6}',
              style: TextStyle(
                color: Color(0xff3B4866),
                fontSize: 24,
                fontFamily: 'moebiusRegular',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  imageDescriptions[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff3B4866),
                    fontSize: 20,
                    fontFamily: 'moebiusRegular',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 258,
                  height: 31,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff727DBC),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      '닫기',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'moebiusRegular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
