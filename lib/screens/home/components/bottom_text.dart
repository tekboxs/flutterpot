import 'package:flutter/material.dart';

import '../models/lastest_response_model.dart';
import 'option_content.dart';

class BottomText extends StatelessWidget {
  final LastestResultsModel result;
  const BottomText({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Acumulado em ${result.acumuladaProxConcurso}!!',
          style: displayStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        Text("Jogue até ${result.dataProxConcurso}", style: displayStyle)
      ],
    );
  }
}
