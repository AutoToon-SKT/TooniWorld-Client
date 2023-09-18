import 'package:flutter/material.dart';
import 'package:SKT_FLY_AI/screen/myalbum3.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart'; // 추가

class CartoonResultScreen2 extends StatefulWidget {
  final List<int> selectedImageIndicesList;

  CartoonResultScreen2({required this.selectedImageIndicesList});

  @override
  _CartoonResultScreen2State createState() => _CartoonResultScreen2State();
}

class _CartoonResultScreen2State extends State<CartoonResultScreen2> {
  int currentPageIndex = 0;
  late PageController _pageController;

  // 이미지에 대한 설명 리스트ㅖ
  List<String> imageDescriptions = [
    '묘한 설렘과 기대로 가득찬 하루였다. 오늘은 SKT FLY AI 부트캠프의 첫 걸음을 내딛는 날이었다. 새로운 도전 앞에 설레임이 가득하고 미래에 대한 열망이 솟아오르는 기분이었다.',
    '2박 3일 워크샵 첫날 저녁 시간에는 연수원 동료들과 함께 맥주파티를 즐겼다. 모두 다양한 배경과 이야기를 가진 사람들이었지만, 함께 웃으며 대화하는 시간은 마치 오랜 친구들과 함께한 것 같았다. 따뜻한 대화 속에서 친목을 다지는 시간을 보냈다.',
    '7주간 수업 시간에는 실제로 AI문제를 해결하며 공부하는 시간이 시작됐다. 어려운 문제들을 마주하면서도 포기하지 않고 고민하며 새로운 해결책을 찾아내는 과정이 정말 값진 경험이었다. 고난과 열정이 어우러져 성장하는 느낌을 느낄 수 있었다.',
    '3주간 우리 팀은 다양한 배경과 역량을 지닌 멤버들로 구성되었다. 처음에는 서로의 강점과 역할을 파악하는 시간이 필요했지만, 서로를 이해하고 존중하는 분위기 속에서 점점 긴밀하게 협력하며 팀 활동을 진행했다. 프로젝트를 추진하면서 의견 충돌이 있을 때마다, 서로의 다양한 시각을 듣고 공감하는 노력을 했다. 이 과정에서 개개인의 아이디어가 하나로 조합되면서 창의적이고 혁신적인 결과물을 만들어냈다. 결국에는 우리는 대회에서 수상할 수 있었다.',
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
                'SKT FLY AI',
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
                              'assets/images/complete3/img$index.png',
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
                              MyAccountPage3()), // MyAlbumPage으로 이동
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
