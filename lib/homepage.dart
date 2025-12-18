import 'package:flutter/material.dart';
import 'package:newsapp/pages/newshome.dart';
import 'package:newsapp/pages/newssaved.dart';
import 'package:newsapp/pages/newssearch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex=0;

  final List<Widget> _pages=[
    NewsHome(), NewsSearch(), NewsSaved()
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child : _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.amber[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: "Search",
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: "Saved",
              backgroundColor: Colors.green[900],
            ),
          ],
      ),
    );
  }
}
