import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Controller/AddContactsController.dart';

class AddContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddContactsController());
  }
}
