import 'package:newsapp/pages/newshome.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final String text;
  const Categories({required this.text});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _select = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20 ,20),
      child: ElevatedButton(
        onPressed: (){
          toggle();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _select?Colors.black26:Colors.grey[300],
          shape: ContinuousRectangleBorder(
            side: BorderSide(
              width: 5,
              color: Colors.white,
            ),
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(15),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            color: _select?Colors.white:Colors.grey[800],
          ),
        ),
      ),
    );
  }

  void toggle (){
    setState(() {
      _select=!_select;
    });
  }
}
