// ignore_for_file: unnecessary_overrides, unnecessary_this, argument_type_not_assignable_to_error_handler, file_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hashmicro/controller/home_controller.dart';
import 'package:test_hashmicro/helpes.dart/dialog_helpers.dart';
import 'package:test_hashmicro/helpes.dart/snackbar_helpers.dart';
import 'package:test_hashmicro/model/user.dart';
import 'package:test_hashmicro/route/pages.dart';
import 'package:test_hashmicro/services/encrypt_data.dart';
import 'package:test_hashmicro/services/services_preferences.dart';
import 'package:uuid/uuid.dart';

class AddTaskController extends GetxController {
  final HomeController homeC = Get.find();
  final formKey = GlobalKey<FormState>();

  final titleFC = TextEditingController();
  final dateFC = TextEditingController();
  final timesFC = TextEditingController();

  var selectedType = "".obs;

  Future onAddData() async {
    var dataTask = PreferenceService.getListTask() ?? [];

    var data;
    if (this.formKey.currentState!.validate()) {
      if (selectedType.value == "") {
        SnackbarHelper.showError(description: "Please select task type");
      } else {
        try {
          data = {
            "id": EncryptData.encryptAES(Uuid().v4()),
            "title": EncryptData.encryptAES(titleFC.text),
            "date": EncryptData.encryptAES(dateFC.text),
            "times": EncryptData.encryptAES(timesFC.text),
            "type": EncryptData.encryptAES(selectedType.value)
          };
          dataTask.add(jsonEncode(data));
          PreferenceService.setListTask(dataTask);
        } finally {
          if (Get.isDialogOpen!) Get.back();
          homeC.fetchData();
          Get.back();
          SnackbarHelper.showSuccess(description: "Add Task Success");
        }
      }
    }
  }
}
