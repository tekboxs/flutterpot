// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutterpot/screens/home/client/home_client.dart';
import 'package:flutterpot/screens/home/components/option_button.dart';
import 'package:get/get.dart';

import '../models/option_model.dart';

class HomeController extends GetxController {
  @override
  onInit() async {
    _avaibleOptions = await Get.find<HomeClient>().getAllFields();
    _generatedWidgets = _generateWidgets();
    super.onInit();
  }

  //getters
  List<Widget> get widgets => _generatedWidgets;
  bool get isMounted => _mounted.value;
  //getters

  //declarations
  Rx _mounted = false.obs;
  List<OptionModel> _avaibleOptions = [];
  List<Widget> _generatedWidgets = [];
  RxList _expandedMenu = <bool>[].obs;
  //declarations

  List<Widget> _generateWidgets() {
    _expandedMenu.assignAll(List<bool>.filled(_avaibleOptions.length, false));

    List<Widget> widgets = List.generate(
      _avaibleOptions.length,
      (index) => Obx(() => GestureDetector(
            onTap: () {
              _expandedMenu[index] = !_expandedMenu[index];
            },
            child: OptionButton(
              expanded: _expandedMenu[index],
              option: _avaibleOptions[index],
            ),
          )),
    );

    //start build
    _mounted.value = true;
    //start all itens to false
    return widgets;
  }

  closeAll() {
    for (int i = 0; i < _expandedMenu.length; i++) {
      _expandedMenu[i] = false;
    }
  }
}
