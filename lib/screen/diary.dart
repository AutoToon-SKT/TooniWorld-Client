import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SKT_FLY_AI/screen/loading.dart';
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
      home: DiaryScreen(),
    );
  }
}

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  TextEditingController storyController = TextEditingController();
  bool isWriting = false; // 글 작성 중인지 여부를 나타내는 변수

  void _startWriting() {
    setState(() {
      isWriting = true;
    });
  }

  // void _saveStoryAndNavigate() async {
  //   String story = storyController.text;

  //   final infoId = 10; // 실제 사용자 ID로 대체
  //   final url = Uri.parse('http://15.164.170.90:1234/$infoId/story');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'storyContent': story,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(response.body);

  //     int infoId = responseData['data']['infoId'];
  //     int storyId = responseData['data']['storyId'];

  //     // infoId와 storyId를 활용한 처리
  //     // ...
  //   } else if (response.statusCode == 400) {
  //     final responseData = json.decode(response.body);
  //     String errorMessage = responseData['message'];
  //     // 경고 또는 에러 메시지를 표시하거나 다른 처리를 수행할 수 있습니다.
  //     print('에러 발생: $errorMessage');
  //   } else {
  //     // 기타 상태 코드에 대한 처리
  //     // ...
  //   }

  //   // Clear the text field
  //   storyController.clear();

  //   // Navigate to the LoadingScreen
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoadingScreen()),
  //   );

  //   // Set isWriting to false
  //   setState(() {
  //     isWriting = false;
  //   });
  // }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  void _showTipDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '이야기 작성 법',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'moebiusBold',
              color: Color(0xffFF7171),
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. 날짜 및 요약',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '날짜: 이야기를 작성한 날짜를 기록합니다. ex) 2023년 8월 17일 (수요일)',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '요약: 해당 날의 일상을 간략하게 요약합니다. ex) 오늘은 친구들과 함께 공원에서 놀았던 날',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '2. 이야기 내용:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '자유롭게 이야기를 풀어나가며 기록합니다.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '시작 문장: 오늘의 기분이나 이야기의 시작을 나타내는 문장을 작성합니다. ex) 안녕하세요! 오늘은 기분 좋은 하루를 보냈어요.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '묘사: 장소, 인물, 감정을 묘사하여 독자가 상황을 쉽게 상상할 수 있도록 합니다.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '감정 표현: 기뻐하거나 슬퍼하는 등의 감정을 묘사해보세요. 그날의 감정을 드러내는 것이 일기의 매력 중 하나입니다.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '3. 기록 방법:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '그가 청구서를 어떻게 냈는지, 어떤 우체국을 갚았는지 간략하게 언급했습니다.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '4. 끝맺음:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '희망과 다짐: 미래에 대한 희망이나 다음 날에 대한 다짐을 찾아보세요.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'moebiusRegular',
                    color: Color(0xff858080),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: 358,
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
            )
          ],
        );
      },
    );
  }

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
                '당신의 이야기를 작성해 볼까요?',
                style: TextStyle(
                  color: Color(0xff3B4866),
                  fontSize: 24,
                  fontFamily: 'moebiusRegular',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '이야기 작성하기 (Write your Story)',
                    style: TextStyle(
                      color: Color(0xff3B4866),
                      fontSize: 16,
                      fontFamily: 'moebiusBold',
                    ),
                  ),
                  GestureDetector(
                    onTap: _showTipDialog,
                    child: SvgPicture.asset(
                      'assets/icons/diary/tip.svg', // SVG 이미지 경로로 변경
                      height: 24, // 원하는 높이로 조절
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              if (!isWriting)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      '만화가 잘 나오는 TIP!',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'moebiusBold',
                        color: Color(0xffFF7171),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '이야기는 자세하게 작성할수록 더 좋은 그림이 나올 수 있어요!',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'moebiusRegular',
                        color: Color(0xff858080),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      ' ● 사용자가 경험한 일에 대해 자세하게 한줄 한줄 작성을 해주세요.',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'moebiusRegular',
                        color: Color(0xff858080),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      ' ● 같은 경험을 한 사람이 있으면 해당 인물에 대해서도 자세히 묘사해주세요.',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'moebiusRegular',
                        color: Color(0xff858080),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      ' ● 생각나는 장소가 있다면 해당 장소를 자세히 묘사해주세요.',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'moebiusRegular',
                        color: Color(0xff858080),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      ' ● 그림에 추가하고 싶은 요소가 있다면 해당 요소를 자세히 묘사해주세요.',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'moebiusRegular',
                        color: Color(0xff858080),
                      ),
                    ),
                    SizedBox(height: 23),
                    Text(
                      '주의 사항!',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'moebiusBold',
                        color: Color(0xffFF7171),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      ' ● 욕설 / 음란 / 기타 위법에 해당하는 글은 작성을 금지합니다.',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'moebiusRegular',
                        color: Color(0xffFF7171),
                      ),
                    ),
                    SizedBox(height: 28),
                    SizedBox(
                      width: 358,
                      height: 51,
                      child: ElevatedButton(
                        onPressed: _startWriting,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff727DBC),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          '확인',
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
              if (isWriting)
                Column(
                  children: [
                    Container(
                      width: 358,
                      height: 465, // Adjust the height as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffD9D9D9)), // Add a border
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextField(
                        controller: storyController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: '당신의 이야기를 작성하세요.',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide
                                .none, // Remove the border when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide.none, // Remove the focused border
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'moebiusRegular',
                            color: Color(0xff3B4866)),
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                    SizedBox(height: 28),
                    SizedBox(
                      width: 358,
                      height: 51,
                      child: ElevatedButton(
                        onPressed: () {
                          // '투니월드로 가기' 버튼을 눌렀을 때의 동작
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoadingScreen()), // MyAccountPage로 이동
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
                          '만화 생성하기',
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
            ],
          ),
        ),
      ),
    );
  }
}
