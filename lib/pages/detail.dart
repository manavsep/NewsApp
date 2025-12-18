import 'package:flutter/material.dart';
import 'package:newsapp/homepage.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:newsapp/timeconversion.dart';


class Detail extends StatefulWidget {

  final int index;
  const Detail({required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int index=0;

  @override
  void initState() {
    super.initState();
    _loadData();
    index=widget.index;
  }

  Map<String,dynamic>? data;

  @override
  Widget build(BuildContext context) {
    final newsData=data?["articles"][index];
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        title: Text(
          "NewsApp",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>HomePage())
            );
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:[
            Container(
              height:300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(newsData["urlToImage"].toString()),
                  fit:BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  newsData["source"]["name"].toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height:10),
            Text(
              newsData["content"],
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[400],
              ),
            ),
            Text(
              newsData["title"],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height:10),
            Text(
              newsData["description"],
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height:40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    newsData["author"],
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                  child: TimeConversion(time: newsData["publishedAt"]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadData()async{
    var response= await rootBundle.loadString('assets/files/news.json');
    if(response.isNotEmpty){
      setState(() {
        data=json.decode(response);
      });
    }
  }
}

