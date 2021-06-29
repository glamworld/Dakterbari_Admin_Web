import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Variables{

  static const List<String> dosageList =[
    'Tablet', 'Suppository', 'Oral', 'Suspension', 'Pediatric', 'Drops', 'Syrup','Injection','Cream','Infusion','Ointment'
  ];

  ///This is the entire multi-level list displayed by this app
  static List<Entry> sideBarMenuList(){
    final List<Entry> data = <Entry>[
      Entry('Doctors', FontAwesomeIcons.userMd, <Entry>[
        Entry('All Doctor'),
        Entry('New Doctor'),
        Entry('Register New Doctor'),
      ]),
      Entry('Patients', FontAwesomeIcons.userInjured, <Entry>[
        Entry('All Patient'),
        Entry('New Patient'),
      ]),
      Entry('Medicines', FontAwesomeIcons.capsules, <Entry>[
        Entry('All Medicine'),
        Entry('Add Medicine'),
        Entry('Pending Medicine'),
      ]),
      Entry('Blogs', FontAwesomeIcons.solidNewspaper, <Entry>[
        Entry('All Blog'),
        Entry('Pending Blog'),
        Entry('Write Blog'),
      ]),
      Entry('Representatives', FontAwesomeIcons.universalAccess, <Entry>[
        Entry('All Representative'),
        Entry('Add Representative'),
      ]),
      Entry('Discount Shop', FontAwesomeIcons.storeAlt, <Entry>[
        Entry('All Shop'),
        Entry('Add Shop'),
      ]),
      Entry('Notifications', FontAwesomeIcons.solidBell, <Entry>[
        Entry('All Notification'),
        Entry('Send Notification'),
      ]),
      Entry('Problems', FontAwesomeIcons.exclamationTriangle, <Entry>[
        Entry('Patient Problems'),
        Entry('Doctor Problems'),
      ]),
      Entry('Payments', FontAwesomeIcons.moneyCheckAlt, <Entry>[
        Entry('Discount Shop Payments'),
        Entry('Appointment Payments'),
      ]),
      Entry('Update Payment', FontAwesomeIcons.handHoldingUsd,<Entry>[
        Entry('Dollar Unit & Appointment Charge'),
      ]),
    ];
    return data;
  }
}

class Entry {
  final String title;
  final IconData? iconData;
  final List<Entry>children; //Since this is an expansion list...children can be another list of entries.

  Entry(this.title,[this.iconData, this.children = const <Entry>[]]);
}
