// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopdroid/customer_screens/address_book.dart';
// import 'package:shopdroid/customer_screens/wishlist.dart';
// import 'package:shopdroid/forum/forum.dart';
import 'package:shopdroid/minor_screens/update_password.dart';
import 'package:shopdroid/providers/auth_repo.dart';
import 'package:shopdroid/widgets/alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  /* final String documentId; */
  const ProfileScreen({Key? key /* , required this.documentId */})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? documentId;
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  CollectionReference anonymous =
      FirebaseFirestore.instance.collection('anonymous');

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print(user.uid);
        setState(() {
          documentId = user.uid;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseAuth.instance.currentUser!.isAnonymous
          ? anonymous.doc(documentId).get()
          : customers.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return
              /* Text("Full Name: ${data['full_name']} ${data['last_name']}"); */

              Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black,
                        Colors.black26,
                        Colors.lightBlue,
                        Colors.lightBlue,
                      ],
                    ),
                  ),
                ),
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      pinned: true,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      expandedHeight: 140,
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          return FlexibleSpaceBar(
                            title: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity:
                                  constraints.biggest.height <= 120 ? 1 : 0,
                              child: const Text(
                                '',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            background: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white10,
                                    Colors.black26,
                                    Colors.greenAccent,
                                    Colors.greenAccent,
                                    Colors.pinkAccent,
                                  ],
                                ),
                                // image: DecorationImage(
                                //     image: AssetImage(
                                //         "images/inapp/version 1.0.0+1.png"),
                                //     fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 30),
                                child: Row(
                                  children: [
                                    data['profileimage'] == ''
                                        ? const CircleAvatar(
                                            radius: 40,
                                            backgroundImage: AssetImage(
                                                'images/inapp/coverimage.png'),
                                          )
                                        : CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                data['profileimage']),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        data['name'] == ''
                                            ? 'Welcome Guest'
                                            : data['name'],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    // decoration: BoxDecoration(
                                    //     color: Colors.black54,
                                    //     borderRadius: BorderRadius.circular(30)),
                                    // child: TextButton(
                                    //   child: const Center(
                                    //     child: Text(
                                    //       'Cart',
                                    //       style: TextStyle(
                                    //           color: Colors.yellow, fontSize: 20),
                                    //     ),
                                    //   ),
                                    //   onPressed: () {},
                                    // ),
                                    ),
                                Container(
                                    // color: Colors.yellow,
                                    // child: TextButton(
                                    //   child: SizedBox(
                                    //     height: 40,
                                    //     width: MediaQuery.of(context).size.width *
                                    //         0.2,
                                    //     child: const Center(
                                    //       child: Text(
                                    //         'Orders',
                                    //         style: TextStyle(
                                    //             color: Colors.black54,
                                    //             fontSize: 20),
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   onPressed: () {
                                    //     // Navigator.push(
                                    //     //     context,
                                    //     //     MaterialPageRoute(
                                    //     //         builder: (context) =>
                                    //     //             const CustomerOrders()));
                                    //   },
                                    // ),
                                    ),
                                Container(
                                    // decoration: const BoxDecoration(
                                    //     color: Colors.black54,
                                    //     borderRadius: BorderRadius.only(
                                    //         topRight: Radius.circular(30),
                                    //         bottomRight: Radius.circular(30))),
                                    // child: TextButton(
                                    //   child: SizedBox(
                                    //     height: 40,
                                    //     width: MediaQuery.of(context).size.width *
                                    //         0.2,
                                    //     child: const Center(
                                    //       child: Text(
                                    //         'Wishlist',
                                    //         style: TextStyle(
                                    //             color: Colors.yellow,
                                    //             fontSize: 20),
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   onPressed: () {
                                    //     Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 const WishlistScreen()));
                                    //   },
                                    // ),
                                    )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 150,
                                  child: Image(
                                      image: AssetImage(
                                          'images/inapp/coverimage.png')),
                                ),
                                const ProfileHeaderLabel(
                                  headerLabel: '  Account Info.  ',
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 260,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      children: [
                                        RepeatedListTile(
                                            icon: Icons.email,
                                            subTitle: data['email'] == ''
                                                ? 'Example@gmail.com'
                                                : data['email'],
                                            title: 'Email Address'),
                                        const YellowDivider(),
                                        RepeatedListTile(
                                            icon: Icons.phone,
                                            subTitle: data['phone'] == ''
                                                ? 'example: +254******6'
                                                : data['phone'],
                                            title: 'Phone No.'),
                                        const YellowDivider(),
                                        RepeatedListTile(
                                          onPressed: FirebaseAuth.instance
                                                  .currentUser!.isAnonymous
                                              ? null
                                              : () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AddressBook()));
                                                },
                                          title: 'Address',
                                          icon: Icons.location_pin,
                                          subTitle: userAddress(data),
                                          /*  data['address'] == ''
                                            /  ? 'example : New Jersey - USA'
                                              : data['address'], */
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // const ProfileHeaderLabel(
                                //     headerLabel: '  Account Settings  '),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      children: [
                                        // RepeatedListTile(
                                        //   title: 'Edit Profile',
                                        //   subTitle: '',
                                        //   icon: Icons.edit,
                                        //   onPressed: () {},
                                        // ),
                                        const YellowDivider(),
                                        RepeatedListTile(
                                          title: 'Change Password',
                                          icon: Icons.lock,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const UpdatePassword()));
                                          },
                                        ),
                                        const YellowDivider(),
                                        RepeatedListTile(
                                          title: 'Log Out',
                                          icon: Icons.logout,
                                          onPressed: () async {
                                            MyAlertDilaog.showMyDialog(
                                                context: context,
                                                title: 'Log Out',
                                                content:
                                                    'Are you sure to log out ?',
                                                tabNo: () {
                                                  Navigator.pop(context);
                                                },
                                                tabYes: () async {
                                                  await AuthRepo.logOut();

                                                  await Future.delayed(
                                                          const Duration(
                                                              microseconds:
                                                                  100))
                                                      .whenComplete(() {
                                                    Navigator.pop(context);
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context,
                                                            '/welcome_screen');
                                                  });
                                                });
                                          },
                                        ),
                                        const YellowDivider(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        );
      },
    );
  }

  String userAddress(dynamic data) {
    if (FirebaseAuth.instance.currentUser!.isAnonymous == true) {
      return 'Example: Nairobi - KE';
    } else if (FirebaseAuth.instance.currentUser!.isAnonymous == false &&
        data['address'] == '') {
      return 'Set Your Address';
    }
    return data['address'];
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile(
      {Key? key,
      required this.icon,
      this.onPressed,
      this.subTitle = '',
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({Key? key, required this.headerLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            // child: Divider(
            //   color: Colors.grey,
            //   thickness: 0,
            // ),
          ),
          Text(
            headerLabel,
            style: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
            width: 50,
            // child: Divider(
            //   color: Colors.grey,
            //   thickness: 1,
            // ),
          ),
        ],
      ),
    );
  }
}
