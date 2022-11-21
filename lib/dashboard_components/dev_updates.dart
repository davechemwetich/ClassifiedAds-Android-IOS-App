import 'package:flutter/material.dart';
import 'package:shopdroid/dashboard_components/bug_rep.dart';
import 'package:shopdroid/dashboard_components/updates.dart';
import 'package:shopdroid/dashboard_components/myapps.dart';
import 'package:shopdroid/widgets/appbar_widgets.dart';

class DevUpdates extends StatelessWidget {
  const DevUpdates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const AppBarBackButton(),
          title: const AppBarTitle(
            title: 'Updates',
          ),
          centerTitle: true,
          bottom: const TabBar(
              indicatorColor: Colors.green,
              indicatorWeight: 8,
              tabs: [
                RepeatedTab(label: 'updates docs'),
                RepeatedTab(label: 'My Apps'),
                RepeatedTab(label: 'Bug Report'),
              ]),
        ),
        body: const TabBarView(children: [
          Updates(),
          MyApps(),
          BugRepo(),
        ]),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
          child: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      )),
    );
  }
}
