// ignore_for_file: unnecessary_overrides, unnecessary_this, argument_type_not_assignable_to_error_handler, file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hashmicro/helpes.dart/dialog_helpers.dart';
import 'package:test_hashmicro/helpes.dart/snackbar_helpers.dart';
import 'package:test_hashmicro/model/user.dart';
import 'package:test_hashmicro/route/pages.dart';
import 'package:test_hashmicro/services/services_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameFC = TextEditingController();
  final emailFC = TextEditingController();
  final passwordFC = TextEditingController();

  var listUser = <User>[].obs;
  var userSuccess = User().obs;

  var onShow = true.obs;
  var loginSuccess = false.obs;

  void showPassword() {
    onShow.value = !onShow.value;
  }

  Future onLogin() async {
    loginSuccess.value = false;

    if (this.formKey.currentState!.validate()) {
      DialogHelper.showLoading();
      try {
        for (var i = 0; i < listUser.length; i++) {
          if (emailFC.text == listUser[i].email &&
              passwordFC.text == listUser[i].password) {
            loginSuccess.value = true;
            userSuccess.value = listUser[i];
          }
        }

        if (loginSuccess.value) {
          try {
            PreferenceService.setUsername(userSuccess.value.username!);
          } finally {
            if (Get.isDialogOpen!) Get.back();
            SnackbarHelper.showSuccess(description: "Login success");
            Get.offAllNamed(AppPages.HOME);
          }
        } else {
          if (Get.isDialogOpen!) Get.back();
          SnackbarHelper.showError(description: "Email or password is wrong");
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void onInit() {
    var dataUser = PreferenceService.getListUser() ?? [];

    if (dataUser.isNotEmpty) {
      List.generate(dataUser.length, (index) {
        listUser.add(User.fromJson(jsonDecode(dataUser[index])));
      });
    }
    super.onInit();
  }
}
