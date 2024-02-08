import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/ExportContacts/Controller/ExportContactController.dart';

class ExportContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ExportContactController());
  }
}
