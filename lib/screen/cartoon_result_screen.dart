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
    '오늘은 꿈에 그리던 여행, 미국 그랜드 캐니언에서 일출을 바라보는 날이다. 아침 일찍 출발하여 버스를 타고 그랜드캐니언으로 왔다. 이미 버스 안에서부터 넓은 평야와 푸른 하늘이 기분을 상쾌하게 만들었다.',
    '오전에는 캐니언 엣지 트레일을 따라 걸어보았다. 산책로의 양쪽에는 황량한 사막과 깊고 큰 협곡이 펼쳐져 있었다. 바람이 부는 소리와 새들의 지저귐만이 귀를 자극했다. 경치에 홀린 듯이 사진을 찍고는 그 순간을 나만의 기억으로 간직하고 싶다고 느꼈다.',
    '일출 전 잠시 협곡 레스토랑에서 같이 간 친구들 4명과 지역 음식을 맛보았다. 그랜드 캐니언에서 느끼는 특별한 맛은 이곳만의 매력이었다.  간단하게 음식을 먹고 난 후 등산로를 따라 대자연의 황홀한 아름다움을 더 가까이서 느낄 수 있었다. 하늘에서 내려다보는 경치는 정말로 숨을 죽이는 아름다움이었다. 갈색과 주황색의 약간 노른 하늘이 만들어내는 컬러 팔레트는 정말 찬란했다.',
    '일출이 되어서야 그랜드 캐니언의 황홀함을 경험할 수 있었다. 해가  뜨면서 하늘이 점점 붉게 물들어갔다. 그 붉은 빛이 절벽과 협곡을 비추면서 마치 환상적인 세계로 빠져들어간 듯한 느낌이 들었다.',
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
                '그랜드 캐니언 탐방기',
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
                              'assets/images/complete2/img$index.png',
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
