import 'package:flutter/material.dart';
import 'package:flutterpot/screens/home/binds/home_binds.dart';
import 'package:flutterpot/screens/home/home_screen.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      initialBinding: HomeBinds(),
      getPages: [
        GetPage(
            name: '/home',
            page: () => HomeScreen(
                  controller: Get.find(),
                )),
      ],
    );
  }
}
