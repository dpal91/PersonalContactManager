import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personalcontactbook/Consts/ApplicationStorage/ApplicationStorage.dart';

class ExportContactController extends GetxController {
  TextEditingController filenameCtrl = TextEditingController();
  var err = ''.obs;
  Directory? directory;
  void export() async {
    err.value = '';
    if (filenameCtrl.text.trim() != "") {
      try {
        if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory!.exists()) directory = await getExternalStorageDirectory();
        }

        final path = await directory!.path;
        var fullpath = '$path/${filenameCtrl.text.trim()}.csv';
        final file = File(fullpath);
        //get content
        String csvContent = "name,company,title,phone,email\n";
        List data = ApplicationStorage.getData(ApplicationStorage.ContactList) ?? [];
        for (var item in data) {
          csvContent +=
              item['Name'] + "," + item['Company'] + "," + item['Title'] + "," + item['Mobile'] + "," + item['Email'] + "\n";

          // print(item['Company']);
        }
        file.writeAsString(csvContent);
        Get.back();
        ApplicationStorage.showSuccess("Done", "File Exported to " + fullpath);
      } catch (err, stack) {
        print("Cannot get download folder path");
      }
    } else {
      err.value = 'Enter file name';
    }
  }
}
