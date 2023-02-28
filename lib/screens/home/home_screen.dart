import 'package:flutter/material.dart';
import 'package:flutterpot/screens/home/controllers/home_controller.dart';
import 'package:flutterpot/size_config.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller;
  const HomeScreen({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [ColapseAllButton(controller: controller)],
        title: const Text(
          'Loterias Online',
          style: TextStyle(
              color: Color.fromARGB(255, 36, 36, 36),
              fontWeight: FontWeight.w300),
        ),
      ),
      body: Obx(() {
        return controller.isMounted
            ? SingleChildScrollView(
                child: Column(
                  children: controller.widgets,
                ),
              )
            : SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                ),
              );
      }),
    );
  }
}

class ColapseAllButton extends StatelessWidget {
  const ColapseAllButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isMounted
        ? TextButton.icon(
            onPressed: () {
              controller.closeAll();
            },
            icon: const Icon(Icons.vertical_align_center,
                color: Color.fromARGB(255, 36, 36, 36)),
            label: const Text(
              "Fechar tudo",
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 36, 36),
                  fontWeight: FontWeight.w300),
            ))
        : const SizedBox());
  }
}
