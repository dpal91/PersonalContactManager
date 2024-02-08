import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/Home/Controller/HomePageController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomePageController());
  }
}
