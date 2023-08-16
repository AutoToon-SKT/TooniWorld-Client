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
      home: ChoiceScreen(),
    );
  }
}

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  TextEditingController cartoonNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  DateTime? selectedDateTime;
  String selectedWhoWith = '누구랑';
  String selectedMood = '분위기'; // New variable for Mood selection
  String selectedWeather = '날씨'; // New variable for Mood selection
  String selectedStyle = ''; // New variable for Art Style selection

  void _selectDateTime() async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
          );
        });
      }
    }
  }

  @override
  void dispose() {
    cartoonNameController.dispose();
    locationController.dispose();
    super.dispose();
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 27.0),
              Text(
                '카툰을 만들어 볼까요?',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 24,
                  fontFamily: 'moebiusRegular',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '카툰 이름 (Name)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 48,
                child: TextField(
                  controller: cartoonNameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '카툰이름을 입력하세요.',
                    hintStyle: TextStyle(
                      color: Color(0xff6E6E6E),
                      fontSize: 16,
                      fontFamily: 'moebiusRegular',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                '장소 (Place)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 48,
                child: TextField(
                  controller: locationController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '방문하였거나 추억이 있는 장소를 입력하세요.',
                    hintStyle: TextStyle(
                      color: Color(0xff6E6E6E),
                      fontSize: 16,
                      fontFamily: 'moebiusRegular',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                '날짜 (Date)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _selectDateTime,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '날짜와 시간',
                        style: TextStyle(
                          color: Color(0xff6E6E6E),
                          fontSize: 16,
                          fontFamily: 'moebiusRegular',
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/choice/day.svg',
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              /* 카테고리 */
              SizedBox(height: 24),
              Text(
                '카테고리(Category)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 14),
              /* 누구랑 */
              Text(
                '누구랑(Who)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 14,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /* 가족 버튼 */
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '가족';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '가족'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '가족',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '가족'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '친구';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '친구'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '친구',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '친구'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '연인';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '연인'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '연인',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '연인'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '혼자';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '혼자'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '혼자',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '혼자'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '반려동물';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '반려동물'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '반려동물',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '반려동물'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11), // 버튼과 구분선 사이의 간격 조절
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffD9D9D9), // 직선의 색상 설정
              ),
              SizedBox(height: 11),
              // for Mood
              Text(
                '분위기(Mood)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 14,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 29),
              // first mood button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '따스함';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '따스함'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '따스함',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '따스함'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '고요한';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '고요한'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '고요한',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '고요한'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '즐거운';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '즐거운'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '즐거운',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '즐거운'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '감동적인';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '감동적인'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '감동적인',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '감동적인'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '흥미진진';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '흥미진진'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '흥미진진',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '흥미진진'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                ],
              ),
              // second mood button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '환상적인';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '환상적인'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '환상적인',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '환상적인'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '차가움';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '차가움'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '차가움',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '차가움'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '평화로운';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '평화로운'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '평화로운',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '평화로운'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '상쾌함';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '상쾌함'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '상쾌함',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '상쾌함'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '엄숙함';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '엄숙함'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(
                      '엄숙함',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '엄숙함'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11), // 버튼과 구분선 사이의 간격 조절
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffD9D9D9), // 직선의 색상 설정
              ),
              SizedBox(height: 11),
              // for Weather
              Text(
                '날씨(Weather)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 14,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 29),
              // first mood button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '맑음';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '맑음'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '맑음',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '맑음'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '흐림';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '흐림'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '흐림',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '흐림'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '비';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '비'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '비',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '비'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '눈';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '눈'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '눈',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '눈'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedWhoWith = '천둥/번개';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedWhoWith == '천둥/번개'
                          ? Color(0xff727DBC)
                          : Colors.transparent, // 배경 색 설정
                      elevation: 0, // 그림자 제거
                      side: BorderSide(color: Color(0xff727DBC)), // 테두리 색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // 모서리 조절
                      ),
                    ),
                    child: Text(
                      '천둥/번개',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: selectedWhoWith == '천둥/번개'
                            ? Colors.white
                            : Color(0xff3B4866), // 글씨 색 설정
                      ),
                    ),
                  ),
                ],
              ),

              // Check box
              SizedBox(height: 24),
              Text(
                '그림체(Drawing Style)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff727DBC)), // 네모난 테두리 색상
                  borderRadius: BorderRadius.circular(6), // 테두리 모서리 조절
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedStyle == 'AI 그림체', // 선택된 스타일인지 확인
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedStyle = 'AI 그림체';
                          }
                        });
                      },
                    ),
                    Text(
                      'AI 그림체',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: Color(0xff3B4866),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              // other checkbox
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff727DBC)), // 네모난 테두리 색상
                  borderRadius: BorderRadius.circular(6), // 테두리 모서리 조절
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedStyle == '웹툰 그림체', // 선택된 스타일인지 확인
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedStyle = '웹툰 그림체';
                          }
                        });
                      },
                    ),
                    Text(
                      '웹툰 그림체',
                      style: TextStyle(
                        fontFamily: 'moebiusRegular',
                        fontSize: 14,
                        color: Color(0xff3B4866),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              SizedBox(
                width: 358,
                height: 51,
                child: ElevatedButton(
                  onPressed: () {
                    _showResultDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff727DBC),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '일기 작성하러 가기',
                    style:
                        TextStyle(fontSize: 18, fontFamily: 'moebiusRegular'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('선택한 정보'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('누구랑: $selectedWhoWith'),
              Text('분위기: $selectedMood'),
              Text('날씨: $selectedWeather'),
              Text('카툰 이름: ${cartoonNameController.text}'),
              Text('장소: ${locationController.text}'),
              Text(
                '날짜와 시간: ${selectedDateTime?.year}-${selectedDateTime?.month}-${selectedDateTime?.day} ${selectedDateTime?.hour ?? '선택 안 함'} hour',
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}
