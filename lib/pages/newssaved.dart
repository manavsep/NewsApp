import 'package:flutter/material.dart';
import 'package:newsapp/homepage.dart';
import 'package:newsapp/pages/newshome.dart';

class NewsSaved extends StatelessWidget {
  const NewsSaved({super.key});

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
              onPressed: (){},
              icon: Icon(Icons.search_rounded),
              color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Text(
          "Saved Articles :",
           style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
           ),
        ),
      ),
    );
  }
}
