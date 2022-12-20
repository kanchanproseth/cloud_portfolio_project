import 'package:cloud_portfolio_project/core_widgets/flicker_text_animation.dart';
import 'package:cloud_portfolio_project/core_widgets/spaces.dart';
import 'package:cloud_portfolio_project/core_widgets/sub_menu_list.dart';
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

class MePageDesktop extends StatefulWidget {
  @override
  _MePageDesktopState createState() => _MePageDesktopState();
}

class _MePageDesktopState extends State<MePageDesktop>
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

  @override
  void initState() {
    super.initState();
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
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
                  margin: EdgeInsets.only(
                    left: Sizes.MARGIN_20,
                    top: Sizes.MARGIN_20,
                    bottom: Sizes.MARGIN_20,
                  ),
                  child: MenuList(
                    menuList: Data.menuList,
                    selectedItemRouteName: MePage.mePageRoute,
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
                      child: _buildExperience(),
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

  Widget _buildExperience() {
    return ExperienceTree(
      listHeaderWidget: _buildAboutPageContent(),
      // listFooterWidget: _buildContactContent(),
      headTitle: StringConst.CURRENT_MONTH_YEAR,
      tailTitle: StringConst.STARTED_MONTH_YEAR,
      experienceData: Data.experienceData,
      scrollController: _scrollController,
      widthOfTree: assignWidth(context: context, fraction: 0.52),
    );
  }

  Widget _buildAboutPageContent() {
    ThemeData theme = Theme.of(context);

    widthOfImage = isDisplaySmallDesktopOrIpadPro(context)
        ? 0.2
        : assignWidth(context: context, fraction: 0.2);

    return Container(
      padding: EdgeInsets.only(
        left: (widthOfImage! / 2) + 20,
        top: isDisplaySmallDesktopOrIpadPro(context)
            ? assignHeight(context: context, fraction: 0.02)
            : assignHeight(context: context, fraction: 0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  FlickerTextAnimation(
                    text: StringConst.INTRO,
                    textColor: AppColors.primaryColor,
                    fadeInColor: AppColors.primaryColor,
                    controller: _flickerAnimationController.view,
                    textStyle: theme.textTheme.bodyText1!.copyWith(
                      fontSize: Sizes.TEXT_SIZE_36,
                      fontWeight: FontWeight.w400,
                      color: AppColors.accentColor2,
                    ),
                  ),
                  FlickerTextAnimation(
                    text: StringConst.DEV_NAME,
                    textColor: AppColors.primaryColor,
                    fadeInColor: AppColors.primaryColor,
                    fontSize: Sizes.TEXT_SIZE_50,
                    controller: _flickerAnimationController.view,
                  ),
                ],
              ),
              Container(
                child: Image.asset(
                  FilePath.ME,
                  width: isDisplaySmallDesktopOrIpadPro(context)
                      ? assignHeight(context: context, fraction: 0)
                      : assignHeight(context: context, fraction: 0.45),
                  height: isDisplaySmallDesktopOrIpadPro(context)
                      ? assignHeight(context: context, fraction: 0)
                      : assignHeight(context: context, fraction: 0.45),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          FlickerTextAnimation(
            text: StringConst.PUNCH_LINE,
            textColor: AppColors.primaryColor,
            fadeInColor: AppColors.primaryColor,
            controller: _flickerAnimationController.view,
            textStyle: theme.textTheme.subtitle1!.copyWith(
              fontSize: Sizes.TEXT_SIZE_34,
              color: AppColors.accentColor2,
            ),
          ),
          SpaceH16(),
          Text(
            StringConst.ABOUT_DEV_TEXT,
            style: theme.textTheme.bodyText2!.copyWith(
              color: AppColors.black,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
          ),
          SpaceH40(),
          SubMenuList(
            subMenuData: Data.subMenuData,
            width: assignWidth(
                context: context,
                fraction: 0.6,
                subs: ((widthOfImage)! / 2) + 20),
          ),
        ],
      ),
    );
  }

  _scroll(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
