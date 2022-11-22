// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shopdroid/categories/asessories.dart';
import 'package:shopdroid/categories/bags_category.dart';
import 'package:shopdroid/categories/beauty_categ.dart';
import 'package:shopdroid/categories/electro_categ.dart';
import 'package:shopdroid/categories/home_garden.dart';
import 'package:shopdroid/categories/kids_category.dart';
import 'package:shopdroid/categories/men_categ.dart';
import 'package:shopdroid/categories/shoes_categ.dart';
import 'package:shopdroid/categories/women_categ.dart';
import 'package:shopdroid/widgets/fake_search.dart';

List<ItemsData> items = [
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'beauty'),
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categView(size))
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.bounceInOut);
              },
              child: Container(
                color: items[index].isSelected == true
                    ? Colors.transparent
                    : Colors.transparent,
                height: 100,
                child: Center(
                  child: Text(items[index].label),
                ),
              ),
            );
          }),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.transparent,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          ElectronicsCategory(),
          AccessoriesCategory(),
          BeautyCategory(),
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          AccessoriesCategory(),
          HomeGardenCategory(),
          KidsCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}
