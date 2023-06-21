import 'dart:math';

import 'package:flutter/material.dart';

import '../resources/jitis_meeting_method.dart';
import '../widgets/home_meetin_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitisMeetingMethod _jitisMeetingMethod = JitisMeetingMethod();

  createNewMeeting() async {
    var radom = Random();
    String roomName = (radom.nextInt(10000000) + 10000000).toString();
    _jitisMeetingMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/vide-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            onPressed: createNewMeeting,
            text: 'New Meeting',
            icon: Icons.videocam,
          ),
          HomeMeetingButton(
            onPressed: () => joinMeeting(context),
            text: 'join Meeting',
            icon: Icons.add_box_rounded,
          ),
          HomeMeetingButton(
            onPressed: () {},
            text: 'Schedul',
            icon: Icons.calendar_today,
          ),
          HomeMeetingButton(
            onPressed: () {},
            text: 'Share Screen',
            icon: Icons.videocam,
          ),
        ],
      ),
      Expanded(
          child: Center(
        child: Text(
          'Create/Join Meeting with just a click!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ))
    ]);
    ;
  }
}
