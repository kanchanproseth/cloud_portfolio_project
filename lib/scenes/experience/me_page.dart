import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'me_page_desktop.dart';
import 'me_page_mobile.dart';

class MePage extends StatelessWidget {
  static const String mePageRoute = StringConst.ME_PAGE;

  const MePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: MePageMobile(),
        tablet: MePageDesktop(),
        desktop: MePageDesktop(),
      ),
    );
  }
}
