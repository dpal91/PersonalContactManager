import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/ImportContact/Controller/ImportContactController.dart';

class ImportContactPage extends GetWidget<ImportContactController> {
  const ImportContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Import Contact",
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller.upload();
              },
              child: Text(
                "Upload",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: Obx(() => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        controller.fileType.value != 0
                            ? Image.asset(
                                controller.fileType.value == 1 ? "assets/xls.png" : "assets/csv.png",
                                height: 50,
                                width: 50,
                              )
                            : Text(""),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            controller.fileName.value,
                            style: TextStyle(fontSize: 20),
                            maxLines: 3,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              controller.chooseFile();
                            },
                            child: Text(
                              "Change",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
