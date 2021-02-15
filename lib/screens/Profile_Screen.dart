import '../constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final apiData;
  ProfileScreen(this.apiData);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 32.0,
          )
        ],
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.apiData["data"]["avatar"]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.apiData["data"]["first_name"],
                    style: kUserNameTextStyle,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    widget.apiData["data"]["last_name"],
                    style: kUserNameTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                widget.apiData["support"]["text"],
                textAlign: TextAlign.center,
                style: knameDiscriptionTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "438",
                        style: kFolloingNumberTextStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Posts", style: kFolloingTExtTextStyle)
                    ],
                  ),
                  Column(
                    children: [
                      Text("298", style: kFolloingNumberTextStyle),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Following", style: kFolloingTExtTextStyle)
                    ],
                  ),
                  Column(
                    children: [
                      Text("321k", style: kFolloingNumberTextStyle),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Followers", style: kFolloingTExtTextStyle)
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
                thickness: 1,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonTheme(
                    minWidth: 150,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFF6979F8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.red)),
                      textColor: Colors.white,
                      child: Text(
                        "Follow",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 150,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.red)),
                      textColor: Colors.black,
                      child: Text(
                        "Message",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Photos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ImageShowWidget("images/1.jpg"),
                        SizedBox(
                          width: 5,
                        ),
                        ImageShowWidget("images/2.jpg"),
                        SizedBox(
                          width: 5,
                        ),
                        ImageShowWidget("images/3.jpg")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ImageShowWidget("images/4.jpg"),
                        SizedBox(
                          width: 5,
                        ),
                        ImageShowWidget("images/5.jpg"),
                        SizedBox(
                          width: 5,
                        ),
                        ImageShowWidget("images/6.jpg"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageShowWidget extends StatelessWidget {
  final String image;
  ImageShowWidget(this.image);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
