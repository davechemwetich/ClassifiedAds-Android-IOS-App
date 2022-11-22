// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopdroid/main_screens/customer_home.dart';
import 'package:shopdroid/main_screens/onboarding_screen.dart';
import 'package:shopdroid/main_screens/supplier_home.dart';
import 'package:shopdroid/main_screens/welcome_screen.dart';
import 'package:shopdroid/providers/cart_provider.dart';
// import 'package:shopdroid/providers/theme_provider.dart';
import 'package:shopdroid/providers/wish_provider.dart';
import 'package:provider/provider.dart';

import 'auth/customer_login.dart';
import 'auth/customer_signup.dart';
import 'auth/supplier_login.dart';
import 'auth/supplier_signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
    ChangeNotifierProvider(create: (_) => Wish()),
  ], child: const DroidShop()));
}

class DroidShop extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const DroidShop({Key? key}) : super(key: key);
  // static const String title = 'Light & Dark Theme';

  @override
  Widget build(BuildContext context) {
//     return MaterialApp(
//       // themeMode: ThemeMode.system,
//       // theme: MyThemes.lightTheme,
//       // darkTheme: MyThemes.darkTheme,
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/welcome_screen',
//       routes: {
//         '/welcome_screen': (context) => const WelcomeScreen(),
//         '/onboarding_screen': (context) => const Onboardingscreen(),
//         '/customer_home': (context) => const CustomerHomeScreen(),
//         '/supplier_home': (context) => const SupplierHomeScreen(),
//         '/customer_signup': (context) => const CustomerRegister(),
//         '/customer_login': (context) => const CustomerLogin(),
//         '/supplier_signup': (context) => const SupplierRegister(),
//         '/supplier_login': (context) => const SupplierLogin(),
//       },
//     );
//   }
// }

    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.grey),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            // Remove the debug banner
            debugShowCheckedModeBanner: false,

            initialRoute: '/welcome_screen',
            routes: {
              '/welcome_screen': (context) => const WelcomeScreen(),
              '/onboarding_screen': (context) => const Onboardingscreen(),
              '/customer_home': (context) => const CustomerHomeScreen(),
              '/supplier_home': (context) => const SupplierHomeScreen(),
              '/customer_signup': (context) => const CustomerRegister(),
              '/customer_login': (context) => const CustomerLogin(),
              '/supplier_signup': (context) => const SupplierRegister(),
              '/supplier_login': (context) => const SupplierLogin(),
            },
          );
        });
  }
}
