import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'experience_page_desktop.dart';
import 'experience_page_mobile.dart';

class ExperiencePage extends StatelessWidget {
  static const String experiencePageRoute = StringConst.EXPERIENCE_PAGE;

  const ExperiencePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: ExperiencePageDesktop(),
        tablet: ExperiencePageDesktop(),
        desktop: ExperiencePageDesktop(),
      ),
    );
  }
}
