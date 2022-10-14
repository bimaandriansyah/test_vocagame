// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/constant/text.dart';
import 'package:test_hashmicro/controller/register_controller.dart';
import 'package:test_hashmicro/route/pages.dart';
import 'package:test_hashmicro/widget/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerC = Get.put(RegisterController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
              key: registerC.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Register to Continue",
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
                    "Username",
                    style: AppTextStyles.text16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 6),
                  CustomTextFieldV2(
                    controller: registerC.usernameFC,
                    hint: "Your Username..",
                    suffixIcon: Icon(Icons.person_outline),
                    validation: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == '') {
                        return 'Username masih kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Email Id",
                    style: AppTextStyles.text16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 6),
                  CustomTextFieldV2(
                    controller: registerC.emailFC,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Your Email id..",
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
                        controller: registerC.passwordFC,
                        isShow: registerC.onShow.value,
                        keyboardType: TextInputType.visiblePassword,
                        hint: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () => registerC.showPassword(),
                          child: Icon(registerC.onShow.value
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
                        registerC.onRegister();
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
                        "REGISTER",
                        style: AppTextStyles.text16Bold
                            .copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyles.text14
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      GestureDetector(
                        onTap: () => Get.offNamed(AppPages.LOGIN),
                        child: Text(
                          'Sign In',
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
