import 'package:cloud_portfolio_project/scenes/ReadMe/readme_page_desktop.dart';
import 'package:cloud_portfolio_project/scenes/ReadMe/readme_page_mobile.dart';
import 'package:cloud_portfolio_project/scenes/contact/contact_page_desktop.dart';
import 'package:cloud_portfolio_project/scenes/contact/contact_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ReadMePage extends StatelessWidget {
  static const String readMePageRoute = StringConst.README;

  const ReadMePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: ReadMePageMobile(),
        tablet: ReadMePageDesktop(),
        desktop: ReadMePageDesktop(),
      ),
    );
  }
}
