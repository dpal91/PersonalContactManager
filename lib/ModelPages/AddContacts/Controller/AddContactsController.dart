import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personalcontactbook/Consts/ApplicationStorage/ApplicationStorage.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Model/Contact.dart';
import 'package:personalcontactbook/ModelPages/ContactDashBoard/Controller/ContactDashboardController.dart';

class AddContactsController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController compCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  // TextEditingController workCtrl = TextEditingController();
  TextEditingController mobCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  var errname = ''.obs;
  var errmob = ''.obs;

  void saveContact() {
    if (valid()) {
      List ctList = ApplicationStorage.getData(ApplicationStorage.ContactList) ?? [];
      Contacts contacts = Contacts(nameCtrl.text.trim() ?? " ", compCtrl.text.trim() ?? " ", titleCtrl.text.trim() ?? " ",
          mobCtrl.text.trim() ?? " ", emailCtrl.text.trim() ?? " ");
      ctList.add(contacts.toJson());
      ApplicationStorage.saveData(ApplicationStorage.ContactList, ctList);
      ContactDashboardController contactDashboardController = Get.find();
      contactDashboardController.needUpdate.value = true;
      Get.back();
      ApplicationStorage.showSuccess("Done", "Data Saved Successfully");
    }
  }

  bool valid() {
    errmob.value = errname.value = '';
    if (nameCtrl.text.trim() == "") {
      errname.value = "Please enter name";
      return false;
    }
    if (mobCtrl.text.trim() == "") {
      errmob.value = "Please enter mobile number";
      return false;
    }
    return true;
  }
}
