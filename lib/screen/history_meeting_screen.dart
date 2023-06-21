import 'package:flutter/material.dart';
import 'package:zoomapp/resources/firebasestore.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethod().historysMeeting,
      builder: ((context, sanpshot) {
        if (sanpshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: (sanpshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                      'Room Name :${(sanpshot.data! as dynamic).docs[index]['meetingName']}'),
                  subtitle: Text(
                    'Joined on ${(sanpshot.data! as dynamic).docs[index]['createdAt']} ',
                  ),
                ));
      }),
    );
  }
}
