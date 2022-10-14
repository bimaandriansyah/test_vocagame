// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/constant/text.dart';
import 'package:test_hashmicro/controller/login_controller.dart';
import 'package:test_hashmicro/route/pages.dart';
import 'package:test_hashmicro/widget/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginC = Get.put(LoginController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: AppColors.primaryColor,
            ),
            child: Form(
              key: loginC.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Welcome to TODO!",
                      style: AppTextStyles.text24Bold
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Container(
                      height: 4,
                      width: 40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Email Id",
                    style: AppTextStyles.text16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 6),
                  CustomTextFieldV2(
                    controller: loginC.emailFC,
                    hint: "Your Email id..",
                    inputAction: TextInputAction.next,
                    suffixIcon: Icon(Icons.mail_outline),
                    validation: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == '') {
                        return 'Email masih kosong';
                      }
                      if (!GetUtils.isEmail(value)) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Password",
                    style: AppTextStyles.text16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 6),
                  Obx(() => CustomTextFieldV2(
                        controller: loginC.passwordFC,
                        isShow: loginC.onShow.value,
                        keyboardType: TextInputType.visiblePassword,
                        hint: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () => loginC.showPassword(),
                          child: Icon(loginC.onShow.value
                              ? Icons.lock_outline
                              : Icons.lock_open_outlined),
                        ),
                        validation: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim() == '') {
                            return 'Password masih kosong';
                          }
                          return null;
                        },
                      )),
                  SizedBox(height: 24),
                  Container(
                    width: Get.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        loginC.onLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.darkBlueColor,
                        elevation: 0,
                        textStyle: TextTheme().button,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "LOGIN",
                        style: AppTextStyles.text16Bold
                            .copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          color: AppColors.whiteColor,
                        ),
                        Container(
                          color: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "or continue with",
                            style: AppTextStyles.text14
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteColor,
                        ),
                        child: SvgPicture.asset('assets/icons/facebook.svg'),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteColor,
                        ),
                        child: SvgPicture.asset('assets/icons/twitter.svg'),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteColor,
                        ),
                        child: SvgPicture.asset('assets/icons/in.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTextStyles.text14
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      GestureDetector(
                        onTap: () => Get.offNamed(AppPages.REGISTER),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.text14Bold.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
