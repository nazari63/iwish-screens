import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/router/app_router.dart';
import 'package:wish_list/utils/router/route_names.dart';
import 'package:wish_list/utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wish List',
      theme: ThemeData(
        primarySwatch: AppColors.generateMaterialColor(AppColors.primaryColor),
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: RouteNames.onBoardingScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
