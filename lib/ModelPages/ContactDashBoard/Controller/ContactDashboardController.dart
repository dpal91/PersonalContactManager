import 'package:get/get.dart';
import 'package:personalcontactbook/Consts/ApplicationStorage/ApplicationStorage.dart';

class ContactDashboardController extends GetxController {
  var contactList = [];
  var needUpdate = false.obs;
  ContactDashboardController() {
    getContacts();
  }

  void getContacts() {
    var list = ApplicationStorage.getData(ApplicationStorage.ContactList) ?? [];
    contactList = list;
  }
}
