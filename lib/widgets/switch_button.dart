// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopdroid/providers/theme_provider.dart';

// class Switch extends StatelessWidget {
//   const Switch({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Switch.adaptive(
//       value: themeProvider.isDarkMode,
//       onChanged: (value) {
//         final provider = Provider.of<ThemeProvider>(context, listen: false);
//         provider.toggleTheme(value);
//       },
//     );
//   }
// }
