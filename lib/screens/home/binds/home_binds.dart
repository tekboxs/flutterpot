import 'package:flutterpot/screens/home/client/home_client.dart';
import 'package:flutterpot/screens/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../client/dio_client.dart';

class HomeBinds extends Bindings {
  @override
  void dependencies() {
    //http service
    Get.put<Client>(DioClient());
    Get.lazyPut<HomeClient>(() => HomeClient(Get.find()));

    //controller
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
