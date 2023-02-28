import 'package:flutter/material.dart';

import '../models/option_model.dart';

//main text displayed all time
class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.option,
  }) : super(key: key);

  final OptionModel option;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 60,
        top: 20,
        child: Text(
          option.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ));
  }
}
