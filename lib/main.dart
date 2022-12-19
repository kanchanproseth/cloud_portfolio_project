import 'package:cloud_portfolio_project/scenes/experience/experience_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_portfolio_project/themes/app_theme.dart';
import 'package:cloud_portfolio_project/routes/routes.dart';
import 'package:cloud_portfolio_project/values/values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_TITLE,
      theme: AppTheme.lightThemeData,
      initialRoute: ExperiencePage.experiencePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
