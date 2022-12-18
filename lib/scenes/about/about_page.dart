import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/scenes/about/about_page_desktop.dart';
import 'package:cloud_portfolio_project/scenes/about/about_page_mobile.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add bottomBar to about page
class AboutPage extends StatelessWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;

  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: AboutPageMobile(),
        tablet: AboutPageDesktop(),
        desktop: AboutPageDesktop(),
      ),
    );
  }
}
