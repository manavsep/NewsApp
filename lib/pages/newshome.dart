import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:newsapp/pages/profile.dart';
import 'package:newsapp/categories.dart';
import 'package:newsapp/pages/detail.dart';
import 'package:newsapp/timeconversion.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Map<String,dynamic>? data;
  final List _category =["Tech","Sports","Business","Politics","Cinema"];

  @override
  Widget build(BuildContext context) {
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
          actions:[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 4, 2),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context)=>Profile())
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pfp.jpeg'),
                  radius: 20,
                ),
              ),
            ),
          ],
        ),
      body: Column(
        children: [
          Container(
            height:100,
            child: ListView.builder(
              itemCount: _category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index) {
                return Categories(text:_category[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data?["totalResults"],
              itemBuilder: (context, index){
                final newsData=data?["articles"][index];
                return GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Detail(index: index))
                    );
                  } ,
                  child: Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(8, 5, 8, 5),
                    child: Card(
                      color: Colors.grey[800],
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children:[
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(newsData["urlToImage"].toString()),
                                fit: BoxFit.cover,
                              )
                            ),
                            child: Container(
                              alignment: AlignmentGeometry.topLeft,
                              padding: EdgeInsets.all(10),
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
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.fromLTRB(4, 3, 4, 3),
                                  child: Text(
                                    newsData["title"],
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
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
