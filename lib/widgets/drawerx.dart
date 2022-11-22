import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:shopdroid/widgets/my_drawer.dart';

class ActionDraw extends StatefulWidget {
  const ActionDraw({Key? key}) : super(key: key);

  @override
  State<ActionDraw> createState() => _ActionDrawState();
}

class _ActionDrawState extends State<ActionDraw> {
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  bool openNavigationDrawer = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      drawer: SizedBox(
        width: 265,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: const MyDrawer(),
        ),
      ),
    );
  }
}
