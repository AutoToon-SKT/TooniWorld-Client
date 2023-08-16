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
  DateTime? selectedDate;

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cartoonNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(
                  color: Color(0xff6E6E6E),
                  fontSize: 16,
                  fontFamily: 'moebiusRegular',
                ),
                hintText: '카툰이름을 입력하세요.',
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(
                  color: Color(0xff6E6E6E),
                  fontSize: 16,
                  fontFamily: 'moebiusRegular',
                ),
                hintText: '방문하였거나 추억이 있는 장소를 입력하세요.',
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: _selectDate,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  selectedDate == null
                      ? '날짜 선택'
                      : '선택한 날짜: ${selectedDate!.toString().split(' ')[0]}',
                  style: TextStyle(
                    color: Color(0xff6E6E6E),
                    fontSize: 16,
                    fontFamily: 'moebiusRegular',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showResultDialog();
              },
              child: Text('확인'),
            ),
          ],
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
              Text('카툰 이름: ${cartoonNameController.text}'),
              Text('장소: ${locationController.text}'),
              Text('날짜: ${selectedDate?.toString().split(' ')[0] ?? '선택 안 함'}'),
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
