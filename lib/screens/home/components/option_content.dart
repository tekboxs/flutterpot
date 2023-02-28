import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../models/lastest_response_model.dart';
import 'bottom_text.dart';

const displayStyle = TextStyle(
  color: Colors.white,
);

class OptionContentsWidget extends StatelessWidget {
  final LastestResultsModel result;
  const OptionContentsWidget({Key? key, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${result.data}   N°${result.concurso}", style: displayStyle),
          Text(
            "Números sorteados",
            style: displayStyle.copyWith(fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),
          //define size for avoid vertical constraints error
          SizedBox(
            width: SizeConfig.screenWidth - 80,
            height: getProportionateScreenHeight(100),
            child: GridView.count(
              mainAxisSpacing: 5,
              childAspectRatio: 1.3,
              crossAxisCount: 6,
              children: generateNumbers(),
            ),
          ),
          if (result.acumulou)
            //display next game date and next jackpot
            BottomText(
              result: result,
            )
        ],
      ),
    );
  }

  List<Widget> generateNumbers() {
    return List.generate(
      result.dezenas.length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Text(
            result.dezenas[index],
          ),
        ),
      ),
    );
  }
}
