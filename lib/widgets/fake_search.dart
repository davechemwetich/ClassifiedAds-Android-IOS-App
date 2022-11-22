// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shopdroid/main.dart';
import 'package:shopdroid/minor_screens/search.dart';
// import 'package:shopdroid/widgets/my_drawer.dart';
// import 'package:flutter/services.dart';
// import 'package:shopdroid/widgets/my_drawer.dart';

class FakeSearch extends StatefulWidget {
  const FakeSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<FakeSearch> createState() => _FakeSearchState();
}

class _FakeSearchState extends State<FakeSearch> {
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  bool openNavigationDrawer = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Positioned(
            // top: 30,
            // left: 14,
            child: GestureDetector(
              onTap: () {
                sKey.currentState!.openDrawer();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.menu,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 1.4),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'What are you looking for?',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  height: 32,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            child: IconButton(
                icon: Icon(DroidShop.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onPressed: () {
                  DroidShop.themeNotifier.value =
                      DroidShop.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                })
            // child: IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.dark_mode,
            //     color: Colors.amber,
            //   ),
            // ),
            )
      ],
    );
  }
}









//     return InkWell(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const SearchScreen()));
//       },
//       child: Container(
//         height: 35,
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.yellow, width: 1.4),
//             borderRadius: BorderRadius.circular(25)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: const [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(
//                     Icons.search,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   'What are you looking for?',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//             Container(
//               height: 32,
//               width: 75,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(25)),
//               child: const Center(
//                 child: Text(
//                   'Search',
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
