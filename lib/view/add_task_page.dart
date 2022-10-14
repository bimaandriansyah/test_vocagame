// ignore_for_file: prefer_const_constructors, unnecessary_const, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/constant/text.dart';
import 'package:test_hashmicro/controller/add_task_controller.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddTaskController addTaskC = Get.put(AddTaskController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              "Create New Task",
              style: AppTextStyles.text20Bold
                  .copyWith(color: AppColors.whiteColor),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height,
                padding:
                    EdgeInsets.only(left: 24, bottom: 24, right: 24, top: 48),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Form(
                  key: addTaskC.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task Title",
                        style: AppTextStyles.text14
                            .copyWith(color: AppColors.darkGreyColor),
                      ),
                      SizedBox(height: 6),
                      textFieldAddTask(
                        controller: addTaskC.titleFC,
                        hint: "Task Title",
                        validation: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim() == '') {
                            return 'Title masih kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Choose Date",
                        style: AppTextStyles.text14
                            .copyWith(color: AppColors.darkGreyColor),
                      ),
                      SizedBox(height: 6),
                      textFieldAddTask(
                        controller: addTaskC.dateFC,
                        readOnly: true,
                        hint: "Choose Date",
                        validation: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim() == '') {
                            return 'Date masih kosong';
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd MMM yyy').format(pickedDate);

                            addTaskC.dateFC.text = formattedDate;
                          }
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Starting Time",
                        style: AppTextStyles.text14
                            .copyWith(color: AppColors.darkGreyColor),
                      ),
                      SizedBox(height: 6),
                      textFieldAddTask(
                        controller: addTaskC.timesFC,
                        readOnly: true,
                        hint: "Starting Time",
                        validation: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim() == '') {
                            return 'Time masih kosong';
                          }
                          return null;
                        },
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (pickedTime != null) {
                            addTaskC.timesFC.text =
                                "${pickedTime.format(context)} ${pickedTime.period.name.toUpperCase()}";
                          }
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Type Task",
                        style: AppTextStyles.text14
                            .copyWith(color: AppColors.darkGreyColor),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          typeCard(value: "Important", title: "Important"),
                          SizedBox(width: 12),
                          typeCard(value: "Secondary", title: "Secondary"),
                        ],
                      ),
                      SizedBox(height: 24),
                      Container(
                        width: Get.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            addTaskC.onAddData();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.secondaryColor,
                            elevation: 0,
                            textStyle: TextTheme().button,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Add New Task",
                            style: AppTextStyles.text16Bold
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget typeCard({
  required String value,
  required String title,
}) {
  final AddTaskController addTaskC = Get.find();
  return Expanded(
    child: Obx(() => GestureDetector(
          onTap: () => addTaskC.selectedType.value = value,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: addTaskC.selectedType.value == value
                  ? AppColors.extraLightGreyColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: addTaskC.selectedType.value == value
                  ? Border.all(width: 0, color: AppColors.extraLightGreyColor)
                  : Border.all(width: 0.5, color: AppColors.lightGreyColor),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text(
              title,
              style: addTaskC.selectedType.value == value
                  ? AppTextStyles.text14Bold
                      .copyWith(color: AppColors.blackColor)
                  : AppTextStyles.text14
                      .copyWith(color: AppColors.darkGreyColor),
            ),
          ),
        )),
  );
}

Widget textFieldAddTask({
  String? hint,
  TextEditingController? controller,
  FormFieldValidator<String>? validation,
  TextInputType? keyboardType,
  TextInputAction? inputAction,
  bool? readOnly,
  Function()? onTap,
}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly ?? false,
    controller: controller,
    validator: validation,
    textInputAction: inputAction,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.lightGreyColor, fontSize: 12),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
      fillColor: AppColors.extraLightGreyColor,
      filled: true,
      focusColor: AppColors.extraLightGreyColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    ),
  );
}
