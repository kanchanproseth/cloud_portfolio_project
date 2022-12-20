import 'dart:convert';
import 'dart:io';

import 'package:cloud_portfolio_project/app_utils/api_manager.dart';
import 'package:cloud_portfolio_project/core_widgets/flicker_text_animation.dart';
import 'package:cloud_portfolio_project/core_widgets/spaces.dart';
import 'package:cloud_portfolio_project/core_widgets/sub_menu_list.dart';
import 'package:dio/dio.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:cloud_portfolio_project/layout/adaptive.dart';
import 'package:cloud_portfolio_project/scenes/experience/experience_page.dart';
import 'package:cloud_portfolio_project/core_widgets/content_wrapper.dart';
import 'package:cloud_portfolio_project/core_widgets/customer_scroller.dart';
import 'package:cloud_portfolio_project/core_widgets/experience_tree.dart';
import 'package:cloud_portfolio_project/core_widgets/menu_list.dart';
import 'package:cloud_portfolio_project/core_widgets/trailing_info.dart';
import 'package:cloud_portfolio_project/values/values.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

class ContactPageDesktop extends StatefulWidget {
  @override
  _ContactPageDesktopState createState() => _ContactPageDesktopState();
}

class _ContactPageDesktopState extends State<ContactPageDesktop>
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
                    selectedItemRouteName: ExperiencePage.experiencePageRoute,
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
                      child: _buildContactContent(),
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

  Widget _buildContactForm() {
    ThemeData theme = Theme.of(context);

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: FlickerTextAnimation(
              text: "Name",
              textColor: AppColors.primaryColor,
              fadeInColor: AppColors.primaryColor,
              controller: _flickerAnimationController.view,
              textStyle: theme.textTheme.bodyText1!.copyWith(
                fontSize: Sizes.TEXT_SIZE_20,
                fontWeight: FontWeight.w400,
                color: AppColors.accentColor2,
              ),
            ),
          ),
          _buildNameTextField(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: FlickerTextAnimation(
              text: "Email",
              textColor: AppColors.primaryColor,
              fadeInColor: AppColors.primaryColor,
              controller: _flickerAnimationController.view,
              textStyle: theme.textTheme.bodyText1!.copyWith(
                fontSize: Sizes.TEXT_SIZE_20,
                fontWeight: FontWeight.w400,
                color: AppColors.accentColor2,
              ),
            ),
          ),
          _buildEmailTextField(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: FlickerTextAnimation(
              text: "Message",
              textColor: AppColors.primaryColor,
              fadeInColor: AppColors.primaryColor,
              controller: _flickerAnimationController.view,
              textStyle: theme.textTheme.bodyText1!.copyWith(
                fontSize: Sizes.TEXT_SIZE_20,
                fontWeight: FontWeight.w400,
                color: AppColors.accentColor2,
              ),
            ),
          ),
          _buildMessageTextField(),
          SizedBox(height: 20),
          TextButton(
            style: flatButtonStyle,
            onPressed: sendMessage,
            child: Text('Send', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  void sendMessage() {
    String name = _nameTextFieldController.text;
    String email = _emailTextFieldController.text;
    String message = _messageTextFieldController.text;

    if (name.isNotEmpty && email.isNotEmpty && message.isNotEmpty) {
      var data = {
        'contactId': Uuid().v1().toString(),
        'name': name,
        'email': email,
        'message': message
      };
      var api = ApiManager();
      api.postContact(data).then((value) {
        // ElegantNotification.success(
        //         title: Text("Success"),
        //         description: const Text("Message has sent successfully"))
        //     .show(context);
      }, onError: (error) {
        // print(error.toString());
        // ElegantNotification.error(
        //         title: Text("Error"), description: Text("Something went wrong"))
        //     .show(context);
      });

      ElegantNotification.success(
              title: Text(
                "Success",
                style: TextStyle(color: Colors.black),
              ),
              description: const Text(
                  "Thanks you, I will check it as soon as possible",
                  style: TextStyle(color: Colors.black)))
          .show(context);
    }
  }

  ReactiveTextField<dynamic> _buildMessageTextField() {
    return ReactiveTextField(
      controller: _messageTextFieldController,
      cursorColor: Colors.black,
      maxLines: 5,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey300.withOpacity(0.7),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
      formControlName: 'message',
    );
  }

  ReactiveTextField<dynamic> _buildEmailTextField() {
    return ReactiveTextField(
      controller: _emailTextFieldController,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey300.withOpacity(0.7),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
      formControlName: 'email',
    );
  }

  ReactiveTextField<dynamic> _buildNameTextField() {
    return ReactiveTextField(
      controller: _nameTextFieldController,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey300.withOpacity(0.7),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
      formControlName: 'name',
    );
  }

  Widget _buildContactContent() {
    ThemeData theme = Theme.of(context);

    widthOfImage = isDisplaySmallDesktopOrIpadPro(context)
        ? 0.2
        : assignWidth(context: context, fraction: 0.2);

    return Container(
      padding: const EdgeInsets.all(50),
      margin: EdgeInsets.only(
        left: (widthOfImage! / 2) + 20,
        top: isDisplaySmallDesktopOrIpadPro(context)
            ? assignHeight(context: context, fraction: 0.02)
            : assignHeight(context: context, fraction: 0),
      ),
      child: Card(
        elevation: 26,
        color: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: FlickerTextAnimation(
                  text: "Contact",
                  textColor: AppColors.primaryColor,
                  fadeInColor: AppColors.primaryColor,
                  fontSize: Sizes.TEXT_SIZE_50,
                  controller: _flickerAnimationController.view,
                ),
              ),
              SpaceH16(),
              _buildContactForm()
            ],
          ),
        ),
      ),
    );
  }

  _scroll(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
