import 'dart:convert';
import 'dart:io';

import 'package:cloud_portfolio_project/app_utils/api_manager.dart';
import 'package:cloud_portfolio_project/core_widgets/flicker_text_animation.dart';
import 'package:cloud_portfolio_project/core_widgets/spaces.dart';
import 'package:cloud_portfolio_project/core_widgets/sub_menu_list.dart';
import 'package:cloud_portfolio_project/scenes/ReadMe/readme_page.dart';
import 'package:dio/dio.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/layout/adaptive.dart';
import 'package:cloud_portfolio_project/scenes/experience/me_page.dart';
import 'package:cloud_portfolio_project/core_widgets/content_wrapper.dart';
import 'package:cloud_portfolio_project/core_widgets/customer_scroller.dart';
import 'package:cloud_portfolio_project/core_widgets/experience_tree.dart';
import 'package:cloud_portfolio_project/core_widgets/menu_list.dart';
import 'package:cloud_portfolio_project/core_widgets/trailing_info.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart';

class ReadMePageDesktop extends StatefulWidget {
  @override
  _ReadMePageDesktopState createState() => _ReadMePageDesktopState();
}

class _ReadMePageDesktopState extends State<ReadMePageDesktop>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  double? widthOfImage;
  late AnimationController _flickerAnimationController;

  final form = FormGroup({
    'name': FormControl<String>(value: '', validators: [Validators.required]),
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
    'message': FormControl<String>(validators: [Validators.required]),
  });

  late TextEditingController _nameTextFieldController;
  late TextEditingController _emailTextFieldController;
  late TextEditingController _messageTextFieldController;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.accentColor,
    minimumSize: Size(120, 60),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  @override
  void initState() {
    super.initState();
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _nameTextFieldController = TextEditingController();
    _emailTextFieldController = TextEditingController();
    _messageTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ContentWrapper(
                width: assignWidth(
                  context: context,
                  fraction: 0.2,
                ),
                color: AppColors.primaryColor,
                gradient: Gradients.certificationGredient,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.MARGIN_20,
                    top: Sizes.MARGIN_20,
                    bottom: Sizes.MARGIN_20,
                  ),
                  child: MenuList(
                    menuList: Data.menuList,
                    selectedItemRouteName: ReadMePage.readMePageRoute,
                  ),
                ),
              ),
              ContentWrapper(
                width: assignWidth(
                  context: context,
                  fraction: 0.8,
                ),
                color: AppColors.secondaryColor,
                child: Row(
                  children: [
                    Container(
                      width: assignWidth(
                        context: context,
                        fraction: 0.7,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            assignWidth(context: context, fraction: 0.04),
                        vertical:
                            assignHeight(context: context, fraction: 0.04),
                      ),
                      child: _build_markdown(),
                    ),
                    SizedBox(
                      width: assignWidth(
                        context: context,
                        fraction: 0.025,
                      ),
                    ),
                    TrailingInfo(
                      width: assignWidth(
                        context: context,
                        fraction: 0.075,
                      ),
                      trailingWidget: CustomScroller(
                        onUpTap: () {
                          _scroll(_scrollController.position.minScrollExtent);
                        },
                        onDownTap: () {
                          _scroll(_scrollController.position.maxScrollExtent);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _build_markdown() {
    return FutureBuilder(
        future: rootBundle.loadString("../README.md"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data!);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  _scroll(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
