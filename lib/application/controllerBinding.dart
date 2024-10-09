import 'package:get/get.dart';

import '../ui/controllers/allpostController.dart';
import '../ui/controllers/main_bottom_nav_controller.dart';




class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AllpostController());
  }
}