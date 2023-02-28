import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';
import '../models/option_model.dart';
import 'arrow_icon.dart';
import 'description_text.dart';
import 'options_loader.dart';

//button that can switch between expanded or not
class OptionButton extends StatelessWidget {
  final OptionModel option;
  final bool expanded;
  const OptionButton({
    Key? key,
    required this.option,
    required this.expanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: option.color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(expanded ? 320 : 80),
      child: Stack(
        children: [
          //clover asset
          Positioned(
            right: 10,
            bottom: -20,
            child: SvgPicture.asset(
              option.asset,
              color: Colors.white,
              width: getProportionateScreenWidth(60),
              height: getProportionateScreenWidth(60),
            ),
          ),
          ArrowIcon(expanded: expanded),
          DescriptionText(option: option),
          if (expanded)
            Positioned(
              left: 20,
              top: 70,
              child: OptionContentsLoader(id: option.id),
            )
        ],
      ),
    );
  }
}
