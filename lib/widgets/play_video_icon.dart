import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayVideoIcon extends StatelessWidget {
  PlayVideoIcon({super.key, this.radius, this.playIconColor});

  double? radius;
  Color? playIconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: radius,
        child: Icon(
          Icons.play_arrow,
          color: playIconColor,
        ),
      ),
    );
  }
}
