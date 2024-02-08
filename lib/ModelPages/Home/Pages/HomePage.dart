import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:personalcontactbook/Consts/ApplicationRoutes/ApplicationRoutes.dart';
import 'package:personalcontactbook/Consts/ApplicationStorage/ApplicationStorage.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Model/Contact.dart';
import 'package:personalcontactbook/ModelPages/Home/Controller/HomePageController.dart';
import 'package:personalcontactbook/ModelPages/Home/Model/ChartData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends GetWidget<HomePageController> {
  HomePage({super.key});
  List<Chart1> char1List = [
    Chart1("Aug 23", 0),
    Chart1("Sept 23", 0),
    Chart1("Oct 23", 0),
    Chart1("Nov 23", 0),
    Chart1("Dec 23", 0),
    Chart1("Jan 24", 4),
  ];
  List<Chart2> char2List = [
    Chart2("Aug 23", 0, 0),
    Chart2("Sept 23", 0, 0),
    Chart2("Oct 23", 10, 0),
    Chart2("Nov 23", 0, 3),
    Chart2("Dec 23", 0, 0),
    Chart2("Jan 24", 60, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Personal Contact Book"),
      ),
      floatingActionButton: SpeedDial(
        //Speed dial menu
        direction: SpeedDialDirection.up,
        icon: Icons.add, //icon on Floating action button
        activeIcon: Icons.close, //icon when menu is expanded on button
        backgroundColor: Colors.blue, //background color of button
        foregroundColor: Colors.white, //font color, icon color in button
        activeBackgroundColor: Colors.blue, //background color when menu is expanded
        activeForegroundColor: Colors.white,
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,

        elevation: 8.0, //shadow elevation of button
        shape: CircleBorder(), //shape of button

        children: [
          SpeedDialChild(
            child: Icon(Icons.people_alt_sharp),
            foregroundColor: Colors.blue,
            label: 'Add Contacts',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Get.toNamed(ApplicationRoutes.ContactDashboard);
              Get.toNamed(ApplicationRoutes.AddContact);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.import_contacts),
            foregroundColor: Colors.blue,
            label: 'Import Contacts',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Get.toNamed(ApplicationRoutes.ImportContact),
          ),
          SpeedDialChild(
            child: Icon(Icons.perm_device_info),
            foregroundColor: Colors.blue,
            label: 'Import Device\nContacts',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () async {
              final FlutterContactPicker _contactPicker = new FlutterContactPicker();
              // List<Contact>? _contacts;
              final c = await _contactPicker.selectContact();
              Contacts cts = Contacts(c!.fullName ?? "", "", " ", c.phoneNumbers!.first ?? "", "");
              var extContacts = ApplicationStorage.getData(ApplicationStorage.ContactList) ?? [];
              extContacts.add(cts.toJson());
              ApplicationStorage.saveData(ApplicationStorage.ContactList, extContacts);
              Get.back();
              ApplicationStorage.showSuccess("Done!", "Successfully Imported");
              Get.toNamed(ApplicationRoutes.ContactDashboard);
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.file_download_outlined),
              foregroundColor: Colors.blue,
              label: 'Export Device\nContacts',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => Get.toNamed(ApplicationRoutes.ExportContact)),

          //add more menu item childs here
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 5,
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          color: Colors.white,
          child: Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(ApplicationRoutes.ContactDashboard);
                      },
                      icon: Icon(Icons.menu)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                ],
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                height: 400,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(5),
                          child: const Text(
                            "6 M",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50)),
                                ),
                                SizedBox(width: 5),
                                Text("Sent Campaigns"),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       "1",
                        //       style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Container(
                        //           height: 10,
                        //           width: 10,
                        //           decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50)),
                        //         ),
                        //         SizedBox(width: 5),
                        //         Text("Do not mail"),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 255,
                      child: SfCartesianChart(
                        enableAxisAnimation: true,
                        primaryXAxis: CategoryAxis(labelIntersectAction: AxisLabelIntersectAction.rotate45, interval: 1),
                        series: [
                          ColumnSeries(
                            dataSource: char1List,
                            xValueMapper: (datum, index) => datum.xaxis,
                            yValueMapper: (datum, index) => datum.yaxis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 400,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(5),
                          child: const Text(
                            "6 M",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1.6K",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50)),
                                ),
                                SizedBox(width: 5),
                                Text("Contacts"),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50)),
                                ),
                                SizedBox(width: 5),
                                Text("Do not mail"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 255,
                      child: SfCartesianChart(
                        enableAxisAnimation: true,
                        primaryXAxis: CategoryAxis(labelIntersectAction: AxisLabelIntersectAction.rotate45, interval: 1),
                        series: [
                          LineSeries(
                            dataSource: char2List,
                            xValueMapper: (datum, index) => datum.xaxis,
                            yValueMapper: (datum, index) => datum.yaxis,
                          ),
                          LineSeries(
                            dataSource: char2List,
                            xValueMapper: (datum, index) => datum.xaxis,
                            yValueMapper: (datum, index) => datum.zaxis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
