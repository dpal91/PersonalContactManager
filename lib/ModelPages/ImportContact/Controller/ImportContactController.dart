import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:personalcontactbook/Consts/ApplicationRoutes/ApplicationRoutes.dart';
import 'package:personalcontactbook/Consts/ApplicationStorage/ApplicationStorage.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Model/Contact.dart';

class ImportContactController extends GetxController {
  late File file;
  var fileType = 0.obs;
  var fileName = "Please choose".obs;

  var name, company, phone, email, title;

  void upload() async {
    var extContacts = ApplicationStorage.getData(ApplicationStorage.ContactList) ?? [];
    if (fileType.value == 1) {
      try {
        //xls
        var bytes = file.readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            // print(row);
            name = company = phone = email = title = '';
            for (var cell in row) {
              if (cell!.rowIndex == 0) break;
              var value = cell.value.toString().trim();
              if (cell.columnIndex == 0) name += value;
              if (cell.columnIndex == 1) company += value;
              if (cell.columnIndex == 2) title += value;
              if (cell.columnIndex == 3) phone += value;
              if (cell.columnIndex == 4) email += value;
            }
            if (name != "" && phone != "") {
              Contacts cts = Contacts(name, company, title, phone, email);
              extContacts.add(cts.toJson());
            }
          }
        }
        ApplicationStorage.saveData(ApplicationStorage.ContactList, extContacts);
        Get.back();
        ApplicationStorage.showSuccess("Done!", "Successfully Imported");
        Get.toNamed(ApplicationRoutes.ContactDashboard);
      } catch (e) {
        ApplicationStorage.showError("Error!", "Some Error Occurred During reading file");
      }
    }
    if (fileType.value == 2) {
      try {
        //csv
        final input = await file.readAsString();
        List<List<dynamic>> csvTable = CsvToListConverter(eol: "\n").convert(input);
        print(csvTable.length);
        // List<String> data = [];
        // csvTable[0].forEach((value) {
        //   data.add(value.toString());
        // });
        // print(data[10]);

        // print(input.toString());
        int count = 0;
        for (var item in csvTable) {
          count++;
          name = company = phone = email = title = '';
          if (count != 1) {
            name += item[0].toString();
            company += item[1].toString();
            title += item[2].toString();
            phone += item[3].toString();
            email += item[4].toString();
          }
          if (name != "" && phone != "") {
            Contacts cts = Contacts(name, company, title, phone, email);
            print(cts.toJson());
            extContacts.add(cts.toJson());
          }
        }
        ApplicationStorage.saveData(ApplicationStorage.ContactList, extContacts);
        Get.back();
        ApplicationStorage.showSuccess("Done!", "Successfully Imported");
        Get.toNamed(ApplicationRoutes.ContactDashboard);
        // var arr = fields.toString().split("\n");
        // print(arr[0]);
      } catch (e) {
        ApplicationStorage.showError("Error!", "Some Error Occurred During reading file");
      }
    }
  }

  void chooseFile() async {
    fileType.value = 0;
    fileName.value = "";
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'csv'],
    );

    if (result != null) {
      var path = result.files.single.path!;
      print(path);
      file = File(path);
      if (p.extension(path).contains('xls')) fileType.value = 1;
      if (p.extension(path).contains('csv')) fileType.value = 2;
      fileName.value = p.basename(path);
    } else {
      // User canceled the picker
    }
  }
}
