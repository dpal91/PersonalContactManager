import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApplicationStorage {
  static const String ContactList = "ContatctList";
  static saveData(key, List value) {
    if (key == "ContatctList") {
      value = value
        ..sort(
          (a, b) => a['Name'].toString().toLowerCase().compareTo(b['Name'].toString().toLowerCase()),
        );
    }
    GetStorage storage = GetStorage();
    storage.write(key, value);
  }

  static getData(key) {
    GetStorage storage = GetStorage();
    return storage.read(key);
  }

  static showSuccess(title, msg, {sec = 2}) {
    Get.snackbar(title, msg,
        duration: Duration(seconds: sec),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade500,
        colorText: Colors.white);
  }

  static showError(title, msg, {sec = 2}) {
    Get.snackbar(title, msg,
        duration: Duration(seconds: sec),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade500,
        colorText: Colors.white);
  }
}
