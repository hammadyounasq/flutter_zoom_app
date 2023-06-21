import 'package:flutter/material.dart';
import 'package:zoomapp/resources/auth_method.dart';
import 'package:zoomapp/screen/meeting_screen.dart';
import 'package:zoomapp/utils/colors.dart';
import '../widgets/custom_button.dart';
import 'history_meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    Text('Contects'),
    CustomButton(
      text: 'Log Out',
      onPressed: () => AuthMethods().signOut(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Meet & Char '),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          onTap: onPageChange,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Char '),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contants '),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Setting'),
          ]),
    );
  }
}
