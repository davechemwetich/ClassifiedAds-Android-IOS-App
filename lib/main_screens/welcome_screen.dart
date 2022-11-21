// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, unused_import

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shopdroid/widgets/yellow_button.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];

const textStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Acme');

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool processing = false;
  CollectionReference anonymous =
      FirebaseFirestore.instance.collection('anonymous');
  late String _uid;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/inapp/devenv.pw.png'),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'rafiki classified ads',
                    textStyle: textStyle,
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'rafikiStore',
                    textStyle: textStyle,
                    colors: textColors,
                  )
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              const SizedBox(
                height: 120,
                width: 200,
                // child: Image(image: AssetImage('images/inapp/logo.jpg')),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                      fontFamily: 'Acme'),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Buy'),
                      RotateAnimatedText('Sell'),
                      RotateAnimatedText('MarketPlace'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Adverts & stores Posts ',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        // decoration: const BoxDecoration(
                        //     color: Colors.white38,
                        //     borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(50),
                        //         bottomLeft: Radius.circular(50))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            YellowButton(
                                label: 'Log In',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/supplier_login');
                                },
                                width: 0.25),
                            YellowButton(
                                label: 'Sign Up',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/supplier_signup');
                                },
                                width: 0.25)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // height: 60,
                      // // width: MediaQuery.of(context).size.width * 0.9,
                      // decoration: const BoxDecoration(
                      //     color: Colors.white38,
                      //     borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(50),
                      //         bottomRight: Radius.circular(50))),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 8),
                      //       child: YellowButton(
                      //           label: 'Log In',
                      //           onPressed: () {
                      //             Navigator.pushReplacementNamed(
                      //                 context, '/customer_login');
                      //           },
                      //           width: 0.25),
                      //     ),
                      //     const SizedBox(
                      //       width: 150,
                      //     ),
                      //     YellowButton(
                      //         label: 'Sign Up',
                      //         onPressed: () {
                      //           Navigator.pushReplacementNamed(
                      //               context, '/customer_signup');
                      //         },
                      //         width: 0.25),
                      //   ],
                      // ),
                      ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      processing == true
                          ? const CircularProgressIndicator()
                          : GoogleFacebookLogIn(
                              label: 'Skip',
                              onPresssed: () async {
                                setState(() {
                                  processing = true;
                                });
                                await FirebaseAuth.instance
                                    .signInAnonymously()
                                    .whenComplete(() async {
                                  _uid = FirebaseAuth.instance.currentUser!.uid;
                                  await anonymous.doc(_uid).set({
                                    'name': '',
                                    'email': '',
                                    'profileimage': '',
                                    'phone': '',
                                    'address': '',
                                    'cid': _uid
                                  });
                                });

                                Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                              },
                              child: const SizedBox(),
                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleFacebookLogIn extends StatelessWidget {
  final String label;
  final Function() onPresssed;
  final Widget child;
  const GoogleFacebookLogIn(
      {Key? key,
      required this.child,
      required this.label,
      required this.onPresssed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPresssed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(
              label,
              style: const TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
