import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/layout/adaptive.dart';
import 'package:cloud_portfolio_project/app_utils/functions.dart';
import 'package:cloud_portfolio_project/scenes/home/home_page.dart';
import 'package:cloud_portfolio_project/scenes/portfolio/portfolio_page.dart';
import 'package:cloud_portfolio_project/core_widgets/circular_container.dart';
import 'package:cloud_portfolio_project/core_widgets/content_wrapper.dart';
import 'package:cloud_portfolio_project/core_widgets/menu_list.dart';
import 'package:cloud_portfolio_project/core_widgets/spaces.dart';
import 'package:cloud_portfolio_project/core_widgets/trailing_info.dart';
import 'package:cloud_portfolio_project/values/values.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.2),
                      color: AppColors.primaryColor,
                      gradient: Gradients.weddingDayBlueGredient,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: Sizes.MARGIN_20,
                          top: Sizes.MARGIN_20,
                          bottom: Sizes.MARGIN_20,
                        ),
                        child: MenuList(
                          menuList: Data.menuList,
                          selectedItemRouteName: HomePage.homePageRoute,
                        ),
                      ),
                    ),
                    ContentWrapper(
                      width: assignWidth(context: context, fraction: 0.8),
                      color: AppColors.secondaryColor,
                      child: TrailingInfo(
                        onTrailingWidgetPressed: () {
                          Navigator.pushNamed(
                            context,
                            PortfolioPage.portfolioPageRoute,
                          );
                        },
                        trailingWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              StringConst.VIEW_PORTFOLIO,
                              style: theme.textTheme.bodyText1!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SpaceW8(),
                            CircularContainer(
                              color: AppColors.primaryColor,
                              width: Sizes.WIDTH_24,
                              height: Sizes.HEIGHT_24,
                              child: const Icon(
                                Icons.chevron_right,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
