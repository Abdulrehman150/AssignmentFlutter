import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedScreen extends StatefulWidget {
  final api;
  FeedScreen(this.api);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List posts = [];

  fetchData() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/posts#');

    var items = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        posts = items;
      });
    } else {
      setState(() {
        posts = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            size: 32.0,
          )
        ],
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostCard(
              userPicApi: widget.api["data"]["avatar"],
              userName1Api: widget.api["data"]["first_name"],
              userName2Api: widget.api["data"]["last_name"],
              postTitleApi: posts[0]["title"],
              postBodyApi: posts[0]["body"],
              displayImage: "images/6.jpg",
            ),
            SizedBox(
              height: 20,
            ),
            PostCard(
              userPicApi:
                  "https://miro.medium.com/max/3150/1*8OkdLpw_7VokmSrzwXLnbg.jpeg",
              userName1Api: widget.api["data"]["first_name"],
              userName2Api: widget.api["data"]["last_name"],
              postTitleApi: posts[5]["title"],
              postBodyApi: posts[5]["body"],
              displayImage: "images/5.jpg",
            ),
            SizedBox(
              height: 20,
            ),
            PostCard(
              userPicApi: widget.api["data"]["avatar"],
              userName1Api: widget.api["data"]["first_name"],
              userName2Api: widget.api["data"]["last_name"],
              postTitleApi: posts[2]["title"],
              postBodyApi: posts[2]["body"],
              displayImage: "images/2.jpg",
            ),
            SizedBox(
              height: 20,
            ),
            PostCard(
              userPicApi: widget.api["data"]["avatar"],
              userName1Api: widget.api["data"]["first_name"],
              userName2Api: widget.api["data"]["last_name"],
              postTitleApi: posts[3]["title"],
              postBodyApi: posts[3]["body"],
              displayImage: "images/3.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String postTitleApi;
  final String postBodyApi;
  final String userPicApi;
  final String userName1Api;
  final String userName2Api;
  final String displayImage;
  PostCard(
      {this.userPicApi,
      this.displayImage,
      this.userName1Api,
      this.userName2Api,
      this.postBodyApi,
      this.postTitleApi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userPicApi),
            ),
            title: Text(
              userName1Api + " " + userName2Api,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.more_horiz),
            subtitle: Text(
              "20 Minutes ago",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: [
              Container(
                width: 75,
                height: 355,
                child: Column(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 25,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("254"),
                    SizedBox(
                      height: 25,
                    ),
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("3456"),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 355,
                  child: Column(
                    children: [
                      Text(
                        postTitleApi,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        postBodyApi,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 150,
                          width: 220,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(displayImage),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
