import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:personalcontactbook/Consts/ApplicationRoutes/ApplicationRoutes.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Model/Contact.dart';
import 'package:personalcontactbook/ModelPages/ContactDashBoard/Controller/ContactDashboardController.dart';

class ContactDashboardPage extends GetWidget<ContactDashboardController> {
  const ContactDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(ApplicationRoutes.AddContact);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Obx(() => reBuild()),
    );
  }

  reBuild() {
    if (controller.needUpdate.value) {
      controller.needUpdate.toggle();
    }
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return WidgetContactItem(Contacts.fromJson(controller.contactList[index]));
          },
          itemCount: controller.contactList.length,
        ),
      ),
    );
  }
}

WidgetContactItem(Contacts contact) => Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: Center(
                child: Text(
              contact.getInitials(),
              style: TextStyle(fontSize: 20),
            )),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.Name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Container(
                  color: Colors.green.shade50,
                  child: Text("OTHER"),
                ),
                Text(
                  contact.Company,
                  maxLines: 3,
                ),
                Text(contact.Email),
              ],
            ),
          ),
          SizedBox(width: 20),
          Obx(() => Center(
                child: Checkbox(
                  onChanged: (value) {
                    if (value == true)
                      contact.isChecked.value = true;
                    else
                      contact.isChecked.value = false;
                  },
                  value: contact.isChecked.value,
                ),
              ))
        ],
      ),
    );
