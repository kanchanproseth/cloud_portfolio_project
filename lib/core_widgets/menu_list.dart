import 'package:cloud_portfolio_project/core_widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_portfolio_project/app_utils/functions.dart';
import 'package:cloud_portfolio_project/core_widgets/socials.dart';
import 'package:cloud_portfolio_project/core_widgets/spaces.dart';
import 'package:cloud_portfolio_project/values/values.dart';

class MenuList extends StatelessWidget {
  MenuList({
    required this.menuList,
    this.selectedItemRouteName,
  });

  final List<MenuData> menuList;
  final String? selectedItemRouteName;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ..._buildMenuList(menuList: menuList, context: context),
        Spacer(
          flex: 1,
        ),
        Socials(
          isHorizontal: true,
          alignment: Alignment.centerLeft,
          color: AppColors.secondaryColor,
          barColor: AppColors.secondaryColor,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<MenuData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        MenuListItem(
          onTap: () {
            if (menuList[i].title == StringConst.RESUME) {
              Functions.launchUrl(DocumentPath.CV);
            } else {
              Navigator.of(context).pushNamed(menuList[i].routeName);
            }
          },
          title: menuList[i].title,
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH4());
    }
    return menuItems;
  }
}
