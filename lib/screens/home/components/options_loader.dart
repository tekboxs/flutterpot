import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import '../client/home_client.dart';
import '../models/lastest_response_model.dart';
import 'option_content.dart';

class OptionContentsLoader extends StatelessWidget {
  final String id;
  const OptionContentsLoader({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<HomeClient>().getLastResults(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data is LastestResultsModel) {
            //convert data to widget
            return OptionContentsWidget(
              result: snapshot.data as LastestResultsModel,
            );
          }

          //errors like no internet
          return SizedBox(
            width: SizeConfig.screenWidth,
            child: const Center(
              child: Icon(Icons.wifi_off, color: Colors.red),
            ),
          );
        } else {
          //display while loading
          return SizedBox(
            width: SizeConfig.screenWidth - 50,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
