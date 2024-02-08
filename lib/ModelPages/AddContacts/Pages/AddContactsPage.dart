import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Controller/AddContactsController.dart';

class AddContactsPage extends GetWidget<AddContactsController> {
  const AddContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30,
                          )),
                      Expanded(
                          child: Center(
                              child: Text(
                        "Save to Google",
                        style: TextStyle(fontSize: 22),
                      ))),
                      IconButton(
                          onPressed: () {
                            controller.saveContact();
                          },
                          icon: Icon(Icons.check, size: 30)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextField(
                    controller: controller.nameCtrl,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        errorText: controller.errname.value == '' ? null : controller.errname.value,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
                        hintText: "Name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextField(
                    controller: controller.compCtrl,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
                        hintText: "Company"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: controller.titleCtrl,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
                        hintText: "Title"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextField(
                    controller: controller.mobCtrl,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        errorText: controller.errmob.value == '' ? null : controller.errmob.value,
                        prefixIcon: SizedBox(
                          width: 60,
                          child: Center(
                            child: Text("Mobile"),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
                        hintText: "Phone"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextField(
                    controller: controller.emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        prefixIcon: SizedBox(
                          width: 60,
                          child: Center(
                            child: Text("Work"),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
                        hintText: "Email"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Group Name",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
