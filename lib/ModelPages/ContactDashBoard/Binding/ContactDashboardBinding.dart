import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/ContactDashBoard/Controller/ContactDashboardController.dart';

class ContactDashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ContactDashboardController());
  }
}
