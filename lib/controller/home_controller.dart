// ignore_for_file: file_names, unnecessary_overrides, unnecessary_this, unnecessary_null_comparison

import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_hashmicro/model/task.dart';
import 'package:test_hashmicro/services/services_preferences.dart';

class HomeController extends GetxController {
  var listTask = <Task>[].obs;

  Future fetchData() async {
    listTask.clear();
    var dataTask = PreferenceService.getListTask() ?? [];
    if (dataTask.isNotEmpty) {
      List.generate(dataTask.length, (index) {
        listTask.add(Task.fromJson(jsonDecode(dataTask[index])));
      });
    }
    listTask.value = listTask.reversed.toList();
  }

  Future searchData(String keyword) async {
    if (keyword == '') {
      fetchData();
    } else {
      fetchData();
      listTask.value = listTask
          .where((element) =>
              element.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
