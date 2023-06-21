import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoomapp/resources/auth_method.dart';
import 'package:zoomapp/utils/colors.dart';

import '../resources/jitis_meeting_method.dart';
import '../widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final JitisMeetingMethod jitsiMeetMethod = JitisMeetingMethod();
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    super.initState();

    meetingController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
  }

  @override
  void dispose() {
    super.dispose();
    meetingController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  joinMeetin() {
    jitsiMeetMethod.createMeeting(
        roomName: meetingController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join Meet',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            child: TextField(
              controller: meetingController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name ',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: joinMeetin,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: 'Muted audio',
            isMute: isAudioMuted,
            onChanged: onAudioMuted,
          ),
          MeetingOption(
            text: 'Turn off my video',
            isMute: isVideoMuted,
            onChanged: onVideoMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
