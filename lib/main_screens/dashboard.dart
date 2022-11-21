// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopdroid/dashboard_components/edit_business.dart';
import 'package:shopdroid/dashboard_components/manage_products.dart';
import 'package:shopdroid/dashboard_components/supplier_balance.dart';
import 'package:shopdroid/dashboard_components/dev_updates.dart';
import 'package:shopdroid/dashboard_components/supplier_statics.dart';
import 'package:shopdroid/minor_screens/visit_store.dart';
import 'package:shopdroid/widgets/alert_dialog.dart';
import 'package:shopdroid/widgets/appbar_widgets.dart';

List<String> label = [
  'Mystore',
  'balance',
  'Profile',
  'manage',
  'DevStore',
  'statistics',
];

List<IconData> icons = [
  Icons.store,
  Icons.wallet_membership_rounded,
  Icons.edit,
  Icons.settings,
  Icons.shop,
  Icons.show_chart_rounded,
];

List<Widget> pages = [
  VisitStore(suppId: FirebaseAuth.instance.currentUser!.uid),
  const Balance(),
  const EditBusiness(),
  const ManageProducts(),
  const DevUpdates(),
  const Statics()
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: const AppBarTitle(
          title: 'Dashboard',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                MyAlertDilaog.showMyDialog(
                    context: context,
                    title: 'Log Out',
                    content: 'Are you sure to log out ?',
                    tabNo: () {
                      Navigator.pop(context);
                    },
                    tabYes: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, '/welcome_screen');
                    });
              },
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 3,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pages[index]));
              },
              child: Card(
                elevation: 5,
                shadowColor: Colors.green,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 40,
                      color: Colors.green,
                    ),
                    Text(
                      label[index].toUpperCase(),
                      style: const TextStyle(
                          fontSize: 8,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontFamily: 'Acme'),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
