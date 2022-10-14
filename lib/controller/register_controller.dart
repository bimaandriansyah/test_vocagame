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

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameFC = TextEditingController();
  final emailFC = TextEditingController();
  final passwordFC = TextEditingController();

  var listUser = <User>[].obs;

  var onShow = true.obs;
  var alreadyAccount = false.obs;

  void showPassword() {
    onShow.value = !onShow.value;
  }

  Future onRegister() async {
    var dataUser = PreferenceService.getListUser() ?? [];
    alreadyAccount.value = false;

    var data;
    if (this.formKey.currentState!.validate()) {
      DialogHelper.showLoading();
      try {
        for (var i = 0; i < listUser.length; i++) {
          if (emailFC.text == listUser[i].email) {
            alreadyAccount.value = true;
            if (Get.isDialogOpen!) Get.back();
          }
        }

        if (alreadyAccount.value) {
          SnackbarHelper.showError(description: "Email is Already registered");
        } else {
          try {
            data = {
              "id": Uuid().v4(),
              "username": usernameFC.text,
              "email": emailFC.text,
              "password": passwordFC.text
            };
            dataUser.add(jsonEncode(data));
            PreferenceService.setListUser(dataUser);
          } finally {
            if (Get.isDialogOpen!) Get.back();
            SnackbarHelper.showSuccess(description: "Register Success");
            Get.offNamed(AppPages.LOGIN);
          }
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
