import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/myalbum4.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart'; // 추가

class CartoonResultScreen3 extends StatefulWidget {
  final List<int> selectedImageIndicesList;

  CartoonResultScreen3({required this.selectedImageIndicesList});

  @override
  _CartoonResultScreen3State createState() => _CartoonResultScreen3State();
}

class _CartoonResultScreen3State extends State<CartoonResultScreen3> {
  int currentPageIndex = 0;
  late PageController _pageController;

  // 이미지에 대한 설명 리스트
  List<String> imageDescriptions = [
    '6살 때즈음에 이야기인데, 가족들과 함께 가족여행을 갔다. 자세한 것들은 기억이 나지 않지만 갯벌에서 놀았다고 하니 서해였을 것이다.',
    '나는 트레이닝복을 입고 있었고 언니랑 같이 놀고 있었다. 엄마랑 아빠는 저 멀리 커다란 돌 위에 앉아 있었다.',
    '언니랑 재밌게 놀던 와중에 언니가 나한테 장난을 친다고 뻘을 한 주먹 집더니 내 얼굴에 던지고 도망갔다. 나는 화가 나고 서러워서 엉엉 울었다.',
    '엄마한테 당장 이르고 싶어서 뻘 때문에 잘 보이지 않는 눈을 게슴츠레 뜨고 엄마를 쳐다보았는데, 엄마랑 아빠가 나를 보며 깔깔 웃고 있었다.그런 엄마랑 아빠를 향해 언니는 깔깔 웃으며 달려가고 있었다. 당시에는 매우 서러웠지만 지금은 부모님이 웃으신 이유를 알 것 같다. 다 내가 귀엽기 때문!',
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
                '가족들과 함께하는 갯벌체험',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 28,
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
                    int selectedImageIndex =
                        widget.selectedImageIndicesList[index];
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
                              'assets/images/complete5/img$index.png',
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            imageDescriptions[index], // 이미지 인덱스에 해당하는 설명 사용
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff3B4866),
                              fontSize: 12,
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
                              MyAccountPage4()), // MyAlbumPage으로 이동
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
