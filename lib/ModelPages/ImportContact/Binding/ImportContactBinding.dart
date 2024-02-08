import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/ImportContact/Controller/ImportContactController.dart';

class ImportContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ImportContactController());
  }
}
