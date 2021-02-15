import 'package:INTERVIEW_SCREENING/API_Data/UserAPi.dart';
import 'package:INTERVIEW_SCREENING/screens/Feed_Screen.dart';
import 'package:flutter/material.dart';
import 'Profile_Screen.dart';

class InterviewMainScreen extends StatefulWidget {
  @override
  _InterviewMainScreenState createState() => _InterviewMainScreenState();
}

class _InterviewMainScreenState extends State<InterviewMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('InterView Screening')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.grey,
              onPressed: () async {
                var apiData = await getDataOfUserApi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(apiData),
                  ),
                );
              },
              child: Text('Profile Page'),
            ),
            MaterialButton(
              color: Colors.grey,
              onPressed: () async {
                var apiData = await getDataOfUserApi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedScreen(apiData),
                  ),
                );
              },
              child: Text('Feed Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
