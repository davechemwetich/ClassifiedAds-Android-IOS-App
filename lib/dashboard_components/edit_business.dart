import 'package:flutter/material.dart';

import 'package:shopdroid/widgets/appbar_widgets.dart';

class EditBusiness extends StatelessWidget {
  const EditBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        leading: const AppBarBackButton(),
        title: const AppBarTitle(
          title: 'EditBusiness',
        ),
        centerTitle: true,
      ),
    );
  }
}
