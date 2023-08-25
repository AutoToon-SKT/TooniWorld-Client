import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:SKT_FLY_AI/screen/diary.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // 이 줄을 추가해주세요

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
  int infoId = -1; // Initialize with a default value
  TextEditingController cartoonNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  DateTime? selectedDateTime; // Nullable DateTime
  String selectedWhoWith = '누구랑';
  List<String> selectedMoods = [];
  String selectedWeather = ''; // New variable for Weather selection
  String selectedStyle = ''; // New variable for Art Style selection

  /* spring 연동 */
  void _sendDataToBackend() async {
    final userId = 8; // 실제 사용자 ID로 대체
    final url = Uri.parse('http://15.164.170.90:1234/$userId/info');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'toonName': cartoonNameController.text,
        'place': locationController.text,
        'toonDate': selectedDateTime?.toIso8601String(),
        'partner': selectedWhoWith,
        'mood': selectedMoods.join(','),
        'weather': selectedWeather,
        'toonStyle': selectedStyle,
      }),
    );

    if (response.statusCode == 200) {
      // 성공 처리
      final responseData = json.decode(response.body);
      final code = responseData['code'];

      if (code == 200) {
        // 카툰 정보 저장 성공 시 처리
        final infoId = responseData['data']['infoId'];
        final userId = responseData['data']['userId'];
        final toonName = responseData['data']['toonName'];

        print('카툰 정보 저장 성공');
        print('infoId: $infoId');
        print('userId: $userId');
        print('toonName: $toonName');
      } else {
        // 카툰 정보 저장 실패 시 처리
        print('카툰 정보 저장 실패');
      }
    } else if (response.statusCode == 400) {
      // 클라이언트 요청 오류 처리
      final responseData = json.decode(response.body);
      final code = responseData['code'];
      final message = responseData['message'];
      final path = responseData['path'];
      final method = responseData['method'];

      print('클라이언트 요청 오류:');
      print('Code: $code');
      print('Message: $message');
      print('Path: $path');
      print('Method: $method');
    } else {
      // 요청 실패 시 처리
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  }

  void _selectDateTime() async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDateTime != null) {
      setState(() {
        selectedDateTime = pickedDateTime;
      });
    }
  }

  @override
  void dispose() {
    cartoonNameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _sendStoryData() async {
    // 데이터 전송 로직
    _sendDataToBackend();

    // 데이터 전송 후 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiaryScreen(infoId: infoId), // Pass infoId
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 27.0),
              Text(
                '만화를 만들어 볼까요?',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 24,
                  fontFamily: 'moebiusRegular',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    '제목 (Title)',
                    style: TextStyle(
                      color: Color(0xff3B4866),
                      fontSize: 16,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                  SizedBox(width: 4), // 아이콘과 제목 사이 간격 조절
                  Icon(
                    Icons.star,
                    color: Color(0xffFF7171),
                    size: 12, // 별 아이콘의 크기 조절
                  ),
                  SizedBox(width: 2),
                  Text(
                    '필수 입력 사항',
                    style: TextStyle(
                      color: Color(0xffFF7171),
                      fontSize: 12,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                height: 48,
                child: TextField(
                  controller: cartoonNameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffD9D9D9)), // 변경된 부분
                    ),
                    hintText: '제목을 입력하세요.',
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
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD9D9D9)),
                    ),
                    hintText: '장소를 입력하세요.',
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
                        selectedDateTime != null
                            ? DateFormat('yyyy-MM-dd').format(selectedDateTime!)
                            : '날짜와 시간을 입력하세요.',
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
                '카테고리 (Category)',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 16,
                  fontFamily: 'moebiusBold',
                ),
              ),
              SizedBox(height: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '누구랑 (Who)',
                    style: TextStyle(
                      color: Color(0xff3B4866),
                      fontSize: 14,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWhoWithButton('혼자'),
                      buildWhoWithButton('친구'),
                      buildWhoWithButton('연인'),
                      buildWhoWithButton('가족'),
                      buildWhoWithButton('반려동물'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 11),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffD9D9D9),
              ),
              SizedBox(height: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '분위기(Mood)',
                    style: TextStyle(
                      color: Color(0xff3B4866),
                      fontSize: 14,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 7, // 가로 간격
                    children: buildMoodButtons(),
                  ),
                ],
              ),
              SizedBox(height: 11),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffD9D9D9),
              ),
              SizedBox(height: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '날씨(Weather)',
                    style: TextStyle(
                      color: Color(0xff3B4866),
                      fontSize: 14,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildWeatherButton('맑음'),
                      buildWeatherButton('흐림'),
                      buildWeatherButton('비'),
                      buildWeatherButton('눈'),
                      buildWeatherButton('천둥/번개'),
                    ],
                  ),
                ],
              ),
              // Check box
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '그림체(Drawing Style)',
                    style: TextStyle(
                      color: Color(0xff3B4866),
                      fontSize: 16,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                  SizedBox(height: 8),
                  buildArtStyleCheckbox('애니메이션'),
                  SizedBox(height: 8), // 체크박스 간 간격 조절
                  buildArtStyleCheckbox('스케치'),
                ],
              ),
              SizedBox(height: 28),
              SizedBox(
                width: 358,
                height: 51,
                child: ElevatedButton(
                  onPressed: _sendStoryData, // "이야기 작성하기" 버튼을 눌렀을 때 호출할 함수
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff727DBC),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '이야기 작성하기',
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

  Widget buildWhoWithButton(String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedWhoWith = text;
        });
      },
      style: ElevatedButton.styleFrom(
        primary:
            selectedWhoWith == text ? Color(0xff727DBC) : Colors.transparent,
        elevation: 0,
        side: BorderSide(color: Color(0xff727DBC)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'moebiusRegular',
          fontSize: 14,
          color: selectedWhoWith == text ? Colors.white : Color(0xff3B4866),
        ),
      ),
    );
  }

  List<String> moodOptions = [
    '따스함',
    '고요한',
    '즐거운',
    '감동적인',
    '흥미진진',
    '환상적인',
    '차가움',
    '평화로운',
    '상쾌함',
    '엄숙함',
  ];

  List<Widget> buildMoodButtons() {
    return moodOptions.map((mood) {
      return ElevatedButton(
        onPressed: () {
          setState(() {
            if (selectedMoods.contains(mood)) {
              selectedMoods.remove(mood);
            } else {
              selectedMoods.add(mood);
            }
          });
        },
        style: ElevatedButton.styleFrom(
          primary: selectedMoods.contains(mood)
              ? Color(0xff727DBC)
              : Colors.transparent,
          elevation: 0,
          side: BorderSide(color: Color(0xff727DBC)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Text(
          mood,
          style: TextStyle(
            fontFamily: 'moebiusRegular',
            fontSize: 14,
            color:
                selectedMoods.contains(mood) ? Colors.white : Color(0xff3B4866),
          ),
        ),
      );
    }).toList();
  }

  Widget buildWeatherButton(String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedWeather = text;
        });
      },
      style: ElevatedButton.styleFrom(
        primary:
            selectedWeather == text ? Color(0xff727DBC) : Colors.transparent,
        elevation: 0,
        side: BorderSide(color: Color(0xff727DBC)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'moebiusRegular',
          fontSize: 14,
          color: selectedWeather == text ? Colors.white : Color(0xff3B4866),
        ),
      ),
    );
  }

  Widget buildArtStyleCheckbox(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedStyle == text
              ? Color(0xff727DBC)
              : Color(0xffD9D9D9), // 선택 여부에 따라 테두리 색 변경
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Checkbox(
            value: selectedStyle == text,
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedStyle = text;
                }
              });
            },
            activeColor: Color(0xff727DBC), // 체크됐을 때 색상
            checkColor: Color(0xffFFFFFF), // 체크 안됐을 때 체크 표시 색상
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'moebiusRegular',
              fontSize: 14,
              color: Color(0xff3B4866),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
    );
  }

  // void _showResultDialog() {
  //   // ... (이하 코드는 생략)
  // }
}
