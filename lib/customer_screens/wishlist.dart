// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopdroid/models/wish_model.dart';
import 'package:shopdroid/providers/wish_provider.dart';
import 'package:shopdroid/widgets/alert_dialog.dart';
import 'package:shopdroid/widgets/appbar_widgets.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey,
            leading: const AppBarBackButton(),
            title: const AppBarTitle(title: 'Wishlist'),
            centerTitle: true,
            actions: [
              context.watch<Wish>().getWishItems.isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        MyAlertDilaog.showMyDialog(
                            context: context,
                            title: 'Clear Wishlist',
                            content: 'Are you sure to clear Wishlist ?',
                            tabNo: () {
                              Navigator.pop(context);
                            },
                            tabYes: () {
                              context.read<Wish>().clearWishlist();
                              Navigator.pop(context);
                            });
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: Colors.pink,
                      ))
            ],
          ),
          body: context.watch<Wish>().getWishItems.isNotEmpty
              ? const WishItems()
              : const EmptyWishlist(),
        ),
      ),
    );
  }
}

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Your Wishlist Is Empty !',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class WishItems extends StatelessWidget {
  const WishItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Wish>(
      builder: (context, wish, child) {
        return ListView.builder(
            itemCount: wish.count,
            itemBuilder: (context, index) {
              final product = wish.getWishItems[index];
              return WishlistModel(
                product: product,
              );
            });
      },
    );
  }
}
