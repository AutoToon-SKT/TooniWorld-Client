import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bottom extends StatelessWidget {
  final tabController;
  Bottom({this.tabController});
  void _onTapNavigator(int index) {
    tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF1F2F6),
      child: Container(
        height: 88,
        child: TabBar(
          labelColor: Color(0xff727DBC),
          unselectedLabelColor: Color(0xff6E6E6E),
          indicatorColor: Colors.transparent,
          onTap: _onTapNavigator,
          tabs: <Widget>[
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/navigation/home.svg',
                width: 24,
                height: 24,
              ),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 10, fontFamily: 'moebiusRegular'),
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/navigation/chat_t.svg',
                width: 24,
                height: 24,
              ),
              child: Text(
                '챗T',
                style: TextStyle(fontSize: 9, fontFamily: 'moebiusRegular'),
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/navigation/circle.svg',
                width: 35,
                height: 35,
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/navigation/friends.svg',
                width: 24,
                height: 24,
              ),
              child: Text(
                '프랜즈',
                style: TextStyle(fontSize: 9, fontFamily: 'moebiusRegular'),
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/navigation/menu.svg',
                width: 20,
                height: 14,
              ),
              child: Text(
                '메뉴',
                style: TextStyle(fontSize: 9, fontFamily: 'moebiusRegular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
