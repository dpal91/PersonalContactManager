import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/ExportContacts/Controller/ExportContactController.dart';

class ExportContactPage extends GetWidget<ExportContactController> {
  const ExportContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Export Contact",
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller.export();
              },
              child: Text(
                "Export",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Container(
              child: TextField(
                controller: controller.filenameCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter File Name",
                    labelText: "File Name",
                    fillColor: Colors.grey.shade200,
                    errorText: controller.err.value == '' ? null : controller.err.value,
                    filled: true),
              ),
            )),
      ),
    );
  }
}
