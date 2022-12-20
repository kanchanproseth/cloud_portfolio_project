import 'package:cloud_portfolio_project/scenes/contact/contact_page_desktop.dart';
import 'package:cloud_portfolio_project/scenes/contact/contact_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactPage extends StatelessWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;

  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: ContactPageMobile(),
        tablet: ContactPageDesktop(),
        desktop: ContactPageDesktop(),
      ),
    );
  }
}
