// ignore_for_file: prefer_const_constructors, avoid_returning_null_for_void, deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:shopdroid/main_screens/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('null'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.update_rounded),
            title: Text('check for updates'),
            onTap: () {
              launch(
                  'https://devenvzone.netlify.app/?subject=This is Subject Title&body=This is Body of Email');
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share With Friends'),
            onTap: () {
              launch(
                  'https://devenvzone.netlify.app/?subject=This is Subject Title&body=This is Body of Email');
            },
          ),
          ListTile(
            leading: Icon(Icons.bug_report_sharp),
            title: Text('Report Bugs&Fixes'),
            onTap: () {
              launch('sms:+254795781700?body=Hi Welcome ');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.web_rounded),
            title: Text('WebPage'),
            onTap: () {
              launch('https://devenv.pw/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () async {},
          ),
          Divider(),
          ListTile(
            focusColor: Colors.amber,
            hoverColor: Colors.black45,
            leading: Icon(Icons.email_rounded),
            title: Text('Contact Developer'),
            onTap: () async {
              launch(
                  'mailto:daveinc022@gmail.com?subject=This is Subject Title&body=This is Body of Email');
            },
          ),
        ],
      ),
    );
  }
}
