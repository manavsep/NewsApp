import 'package:flutter/material.dart';
import 'package:newsapp/homepage.dart';
import 'package:newsapp/pages/newshome.dart';

class NewsSearch extends StatefulWidget {
  const NewsSearch({super.key});

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {

  void _showDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Searching...")),
        );
      },
    );

  }

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
        actions: [
          IconButton(
            onPressed: _showDialog,
            icon: Icon(Icons.search_rounded),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: TextStyle(
                    color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: TextStyle(
                      color: Colors.grey[600],
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: _showDialog,
              child: Text(
                "Enter",
                style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
