import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/myalbum2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart'; // 추가

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
    '아침에 가족 모두 모여서 계획을 세운다. 엄마가 지도를 펴고, 아빠가 여행 가방을 싸기 시작한다. 동생은 설레는 얼굴로 기다리고 있고, 나는 모험을 상상하며 웃고 있다.',
    '차 안에서의 여행은 웃음 가득하다. 노래를 부르며 나누는 이야기와 재미있는 농담으로 시간이 금방 가는 듯하다. 도로 풍경도 점점 변해가고 있다.',
    '목적지에 도착하면 모두 들떠있다. 해변에서 모래성을 쌓고, 파도와 함께 물놀이를 하며 즐거운 시간을 보낸다. 사진을 찍어 추억을 남기기도 하고 서로의 모습을 감상한다.',
    '물결의 소리와 함께 햇살이 내리쬐는 바닷가, 모래 위에서 걸어가는 우리의 발자국. 소중한 순간들이 한 편의 풍경으로 녹아든 여행 이야기.',
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

  void _shareToCommunity() {
    // 커뮤니티 공유 로직을 여기에 추가할 수 있습니다.

    // 토스트 메시지 표시
    Fluttertoast.showToast(
      msg: '캔버스에 공유되었습니다.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
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
                '개🐶망나니들과 빠지여행',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 20,
                  fontFamily: 'moebiusRegular',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0;
                      i < widget.selectedImageIndicesList.length;
                      i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPageIndex == i
                            ? Color(0xff727DBC)
                            : Colors.grey,
                      ),
                    ),
                ],
              ),
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
                          onTap: () => {},
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
                        SizedBox(height: 30), // 이미지와 설명 사이의 간격 조절
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20), // 좌우 간격 설정
                          child: Text(
                            imageDescriptions[index], // 해당 이미지의 설명 표시
                            textAlign: TextAlign.center, // 가운데 정렬
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 16,
                              fontFamily: 'moebiusRegular',
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
              SizedBox(height: 10),
              Container(
                width: 368,
                height: 51,
                child: ElevatedButton(
                  onPressed: () async {
                    _shareToCommunity();
                    await Future.delayed(
                        Duration(seconds: 2)); // toast 메시지가 나타나는 시간을 대기
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyAccountPage2()), // MyAlbumPage으로 이동
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff727DBC),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    '공유하기',
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
}
