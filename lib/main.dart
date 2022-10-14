import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/route/pages.dart';
import 'package:test_hashmicro/services/services_preferences.dart';
import 'package:test_hashmicro/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var username = PreferenceService.getUsername();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: username != null ? AppPages.HOME : AppRoutes.INITIAL,
      getPages: AppRoutes.pages,
      theme: AppTheme.apptheme,
      defaultTransition: Transition.fade,
    );
  }
}
