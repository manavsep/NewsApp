import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeConversion extends StatelessWidget {
  final String time;
  const TimeConversion({required this.time});

  @override
  Widget build(BuildContext context) {
    DateTime obj =DateTime.parse(time);
    String convertedTime = timeago.format(obj);
    return Text(
      convertedTime,
      style: TextStyle(
        color: Colors.grey[400],
      ),
    );
  }
}
