import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SKT_FLY_AI/screen/cartoon_result_screen3.dart';
import 'package:SKT_FLY_AI/screen/choice2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: ShowCartoonScreen3(),
    );
  }
}

class ShowCartoonScreen3 extends StatefulWidget {
  @override
  _ShowCartoonScreen3State createState() => _ShowCartoonScreen3State();
}

class _ShowCartoonScreen3State extends State<ShowCartoonScreen3> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  List<int> selectedImageIndicesList = List.generate(4, (_) => -1);

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void selectImage(int index, int containerIndex) {
    setState(() {
      selectedImageIndicesList[containerIndex] = index;
    });
  }

  void _navigateToResultScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartoonResultScreen3(
          selectedImageIndicesList: selectedImageIndicesList,
        ),
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              " < 베스트컷 선택 > ",
              style: TextStyle(
                color: Color(0xff3B4866),
                fontSize: 28,
                fontFamily: 'moebiusRegular',
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  width: 358,
                  height: 764,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      FirstContainer(
                        selectedImageIndicesList[0],
                        (containerIndex, imageIndex) =>
                            selectImage(imageIndex, containerIndex),
                      ),
                      SecondContainer(
                        selectedImageIndicesList[1],
                        (containerIndex, imageIndex) =>
                            selectImage(imageIndex, containerIndex),
                      ),
                      ThirdContainer(
                        selectedImageIndicesList[2],
                        (containerIndex, imageIndex) =>
                            selectImage(imageIndex, containerIndex),
                      ),
                      FourthContainer(
                        selectedImageIndicesList[3],
                        (containerIndex, imageIndex) =>
                            selectImage(imageIndex, containerIndex),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8, // 조절하고자 하는 위치 값
                  left: 29, // 조절하고자 하는 위치 값
                  child: SvgPicture.asset(
                    'assets/icons/diary/circle.svg',
                    width: 300,
                  ),
                ),
                Positioned(
                  top: -20, // 다른 SVG 이미지의 위쪽에 겹치게 조절하고자 하는 위치 값
                  left: 29, // 조절하고자 하는 위치 값
                  child: ClipRect(
                    child: SvgPicture.asset(
                      'assets/icons/diary/spring.svg', // 다른 SVG 이미지의 경로
                      width: 300,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentPageIndex > 0) {
                      _navigateToPage(_currentPageIndex - 1);
                    }
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  'PAGE',
                  style: TextStyle(
                    color: Color(0xff3B4866),
                    fontSize: 16,
                    fontFamily: 'moebiusRegular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentPageIndex < 3) {
                      _navigateToPage(_currentPageIndex + 1);
                    }
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                SizedBox(
                  width: 358,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: _navigateToResultScreen,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff727DBC),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      '내 만화 보러가기',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'moebiusRegular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 358,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChoiceScreen2(), // 두 번째 버튼은 ChoiceScreen으로 이동
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff727DBC),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      '이야기 수정하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'moebiusRegular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class FirstContainer extends StatefulWidget {
  final int selectedImageIndex;
  final Function(int, int) onSelect;

  FirstContainer(this.selectedImageIndex, this.onSelect);

  @override
  _FirstContainerState createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: Color(0xffD9D9D9),
          width: 1,
        ),
      ),
      child: Container(
        width: 358,
        height: 764,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // 여기에 추가
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '#1 언니와 갯벌 놀이',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 20,
                        fontFamily: 'moebiusBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => widget.onSelect(0, 0),
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 0
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img1.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(0, 1),
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 1
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img2.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(0, 2),
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 2
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img3.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondContainer extends StatefulWidget {
  final int selectedImageIndex;
  final Function(int, int) onSelect;

  SecondContainer(this.selectedImageIndex, this.onSelect);

  @override
  _SecondContainerState createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: Color(0xffD9D9D9),
          width: 1,
        ),
      ),
      child: Container(
        width: 358,
        height: 764,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '#2 언니 때문에 시작된 뻘 던지기',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 20,
                        fontFamily: 'moebiusBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => widget.onSelect(1, 0),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 0
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img4.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(1, 1),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 1
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img5.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(1, 2),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 2
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img6.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdContainer extends StatefulWidget {
  final int selectedImageIndex;
  final Function(int, int) onSelect;

  ThirdContainer(this.selectedImageIndex, this.onSelect);

  @override
  _ThirdContainerState createState() => _ThirdContainerState();
}

class _ThirdContainerState extends State<ThirdContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: Color(0xffD9D9D9),
          width: 1,
        ),
      ),
      child: Container(
        width: 358,
        height: 764,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '#3 언니때문에 속상한 내 자신',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 20,
                        fontFamily: 'moebiusBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => widget.onSelect(2, 0),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 0
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img7.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(2, 1),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 1
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img8.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(2, 2),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 2
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img9.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FourthContainer extends StatefulWidget {
  final int selectedImageIndex;
  final Function(int, int) onSelect;

  FourthContainer(this.selectedImageIndex, this.onSelect);

  @override
  _FourthContainerState createState() => _FourthContainerState();
}

class _FourthContainerState extends State<FourthContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: Color(0xffD9D9D9),
          width: 1,
        ),
      ),
      child: Container(
        width: 358,
        height: 764,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '#4 이러한 모습을 보고 웃고있는 부모님',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 20,
                        fontFamily: 'moebiusBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => widget.onSelect(3, 0),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 0
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img10.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(3, 1),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 1
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img11.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => widget.onSelect(3, 2),
                    child: ClipRRect(
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.selectedImageIndex == 2
                                ? Color(0xff727DBC)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/result3/img12.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
