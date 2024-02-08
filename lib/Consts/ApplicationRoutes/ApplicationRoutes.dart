import 'package:get/get.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Binding/AddContactBinding.dart';
import 'package:personalcontactbook/ModelPages/AddContacts/Pages/AddContactsPage.dart';
import 'package:personalcontactbook/ModelPages/ContactDashBoard/Binding/ContactDashboardBinding.dart';
import 'package:personalcontactbook/ModelPages/ContactDashBoard/Controller/ContactDashboardController.dart';
import 'package:personalcontactbook/ModelPages/ContactDashBoard/Pages/ContactDashboardPage.dart';
import 'package:personalcontactbook/ModelPages/ExportContacts/Binding/ExportContactBinding.dart';
import 'package:personalcontactbook/ModelPages/ExportContacts/Controller/ExportContactController.dart';
import 'package:personalcontactbook/ModelPages/ExportContacts/Pages/ExportContactPage.dart';
import 'package:personalcontactbook/ModelPages/Home/Binding/HomeBinding.dart';
import 'package:personalcontactbook/ModelPages/Home/Pages/HomePage.dart';
import 'package:personalcontactbook/ModelPages/ImportContact/Binding/ImportContactBinding.dart';
import 'package:personalcontactbook/ModelPages/ImportContact/Pages/ImportContactPage.dart';

class ApplicationRoutes {
  static const String Home = "/home";
  static const String AddContact = "/contactDashboard/addCont";
  static const String ContactDashboard = "/contactDashboard";
  static const String ImportContact = "/importContact";
  static const String ExportContact = "/exportContact";

  static List<GetPage<dynamic>> allPages = [
    GetPage(name: Home, page: () => HomePage(), transition: Transition.rightToLeft, binding: HomeBinding()),
    GetPage(name: AddContact, page: () => AddContactsPage(), transition: Transition.rightToLeft, binding: AddContactBinding()),
    GetPage(
        name: ContactDashboard,
        page: () => ContactDashboardPage(),
        transition: Transition.rightToLeft,
        binding: ContactDashboardBinding()),
    GetPage(
        name: ImportContact,
        page: () => ImportContactPage(),
        transition: Transition.rightToLeft,
        binding: ImportContactBinding()),
    GetPage(
        name: ExportContact,
        page: () => ExportContactPage(),
        transition: Transition.rightToLeft,
        binding: ExportContactBinding()),
  ];
}
