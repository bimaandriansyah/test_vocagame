// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/constant/text.dart';
import 'package:test_hashmicro/controller/home_controller.dart';
import 'package:test_hashmicro/route/pages.dart';
import 'package:test_hashmicro/services/encrypt_data.dart';
import 'package:test_hashmicro/services/services_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.put(HomeController());
    var username = PreferenceService.getUsername();
    return Scaffold(
        bottomNavigationBar: Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/icons/home.svg'),
              SvgPicture.asset('assets/icons/history.svg'),
              GestureDetector(
                  onTap: () => Get.toNamed(AppPages.ADDTASK),
                  child: SvgPicture.asset('assets/icons/add.svg')),
              SvgPicture.asset('assets/icons/actifity.svg'),
              SvgPicture.asset('assets/icons/profile.svg'),
            ],
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: Get.width,
              padding:
                  EdgeInsets.only(top: 48, left: 24, bottom: 24, right: 24),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey $username",
                    style: AppTextStyles.text16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Welcome Back",
                    style: AppTextStyles.text24Bold
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    textInputAction: TextInputAction.search,
                    onChanged: ((value) {
                      homeC.searchData(value);
                    }),
                    style: AppTextStyles.text12
                        .copyWith(color: AppColors.whiteColor),
                    decoration: InputDecoration(
                      hintText: "Search Task",
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.whiteColor,
                      ),
                      hintStyle: TextStyle(
                          color: AppColors.lightGreyColor, fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15),
                        ),
                      ),
                      fillColor: AppColors.semiDarkBlueColor,
                      filled: true,
                      focusColor: AppColors.semiDarkBlueColor,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today Task",
                        style: AppTextStyles.text18Bold
                            .copyWith(color: AppColors.blackColor),
                      ),
                      Obx(() => homeC.listTask.isEmpty
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 24),
                                child: Text(
                                  "Today Task is Empty",
                                  style: AppTextStyles.text14
                                      .copyWith(color: AppColors.blackColor),
                                ),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var data = homeC.listTask[index];
                                return taskCard(
                                    title: data.title, time: data.times);
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 12),
                              itemCount: homeC.listTask.length))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget taskCard({
  required title,
  required time,
}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    child: Row(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            border: Border.all(color: AppColors.darkGreyColor, width: 1),
          ),
        ),
        SizedBox(width: 24),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              EncryptData.decryptAES(title),
              style: AppTextStyles.text16Bold
                  .copyWith(color: AppColors.blackColor),
            ),
            SizedBox(height: 6),
            Text(
              EncryptData.decryptAES(time),
              style:
                  AppTextStyles.text14.copyWith(color: AppColors.darkGreyColor),
            ),
          ],
        ))
      ],
    ),
  );
}
