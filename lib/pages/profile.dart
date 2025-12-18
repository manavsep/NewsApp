import 'package:flutter/material.dart';
import 'package:newsapp/homepage.dart';

class Profile extends StatelessWidget {

  const Profile({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>HomePage()),
            );
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              SnackBar msg = SnackBar(content: Text("Unable to edit"));
              ScaffoldMessenger.of(context).showSnackBar(msg);
            },
            icon: Icon(Icons.edit),
            color: Colors.white,
          ),
        ],
        title: Center(
          child: Text(
            "News App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius:104,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pfp.jpeg'),
                  radius: 100,
                ),
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text(
              "USERNAME",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "@manav_singh",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "NAME",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Manav Singh",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "EMAIL-ID",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "xxxx@gmail.com",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "MOBILE NO.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "xxxxxxxxxxx",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "DOB",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "DD/MM/YY",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}