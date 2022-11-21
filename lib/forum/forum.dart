import 'package:flutter/material.dart';

class FormDev extends StatefulWidget {
  const FormDev({Key? key}) : super(key: key);

  @override
  State<FormDev> createState() => _FormDevState();
}

class _FormDevState extends State<FormDev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(child: Text('Be Done by Dec 20 commimg soon')),
    );
  }
}
