import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: ShowCartoonScreen(),
    );
  }
}

class ShowCartoonScreen extends StatefulWidget {
  @override
  _ShowCartoonScreenState createState() => _ShowCartoonScreenState();
}

class _ShowCartoonScreenState extends State<ShowCartoonScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(0xffF1F2F6),
          elevation: 0,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 28.0),
              SvgPicture.asset(
                'assets/icons/input/logo.svg',
                height: 95,
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
              "\u{1F3A8}  만화 장면 선택하기  \u{1F3A8}",
              style: TextStyle(
                color: Color(0xff3B4866),
                fontSize: 24,
                fontFamily: 'moebiusRegular',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentPageIndex > 0) {
                      _navigateToPage(_currentPageIndex - 1);
                    }
                  },
                  icon: Icon(Icons.arrow_back), // 아이콘 변경 할거임
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
                  icon: Icon(Icons.arrow_forward), // 아이콘 변경 할거임
                ),
              ],
            ),
            Container(
              width: 358,
              height: 764, // Adjust the height according to your needs
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: [
                  FirstContainer(),
                  SecondContainer(),
                  ThirdContainer(),
                  FourthContainer(),
                ],
              ),
            ),
            SizedBox(height: 28),
            SizedBox(
              width: 358,
              height: 51,
              child: ElevatedButton(
                onPressed: () {
                  // Implement the logic for the button action here
                  // For example: navigate to a new screen or show a dialog
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff727DBC),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  '완전하게 만화 생성하기',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'moebiusRegular',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class FirstContainer extends StatefulWidget {
  @override
  _FirstContainerState createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  int selectedImageIndex = -1;

  void selectImage(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

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
        height: 764, // 변경된 부분
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      ' \u{1F499} CUT 1 \u{1F499} ',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 30,
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
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondContainer extends StatefulWidget {
  @override
  _SecondContainerState createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  int selectedImageIndex = -1;

  void selectImage(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

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
        height: 764, // 변경된 부분
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      ' \u{1F49A} "CUT 2" \u{1F49A} ',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 30,
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
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdContainer extends StatefulWidget {
  @override
  _ThirdContainerState createState() => _ThirdContainerState();
}

class _ThirdContainerState extends State<ThirdContainer> {
  int selectedImageIndex = -1;

  void selectImage(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

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
        height: 764, // 변경된 부분
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      ' \u{1F49B} "CUT 3" \u{1F49B} ',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 30,
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
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FourthContainer extends StatefulWidget {
  @override
  _FourthContainerState createState() => _FourthContainerState();
}

class _FourthContainerState extends State<FourthContainer> {
  int selectedImageIndex = -1;

  void selectImage(int index) {
    setState(() {
      selectedImageIndex = index;
    });
  }

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
        height: 764, // 변경된 부분
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      ' \u{1F49C} "CUT 4" \u{1F49C} ',
                      style: TextStyle(
                        color: Color(0xff3B4866),
                        fontSize: 30,
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
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  GestureDetector(
                    onTap: () => selectImage(1),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30), // Adjust the border radius
                      child: Container(
                        width: 286,
                        height: 194,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedImageIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 286 / 194,
                          child: Image.asset('assets/images/home/img16.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
