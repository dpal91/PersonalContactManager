import 'package:get/get.dart';

class Contacts {
  String Name;
  String Company;
  String Title;
  String Mobile;
  String Email;
  var isChecked = false.obs;

  Contacts(this.Name, this.Company, this.Title, this.Mobile, this.Email);
  Contacts.fromJson(Map<dynamic, dynamic> json)
      : Name = json['Name'],
        Company = json['Company'],
        Title = json['Title'],
        Mobile = json['Mobile'],
        Email = json['Email'];

  Map<String, String> toJson() => {
        'Name': Name,
        'Company': Company,
        'Title': Title,
        'Mobile': Mobile,
        'Email': Email,
      };

  getInitials() {
    String ini = Name[0].toUpperCase();
    if (Name.contains(' ')) {
      ini += Name[Name.lastIndexOf(' ') + 1].toUpperCase();
    }
    return ini;
  }
}
