import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//arrow icon that indicate if option is open or not
class ArrowIcon extends StatelessWidget {
  const ArrowIcon({
    Key? key,
    required this.expanded,
  }) : super(key: key);

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 10,
        child: Icon(
          expanded
              ? CupertinoIcons.arrow_up_circle
              : CupertinoIcons.arrow_down_circle,
          color: Colors.white,
          size: 35,
        ));
  }
}
