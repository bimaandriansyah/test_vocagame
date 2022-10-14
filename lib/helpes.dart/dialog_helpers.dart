// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/constant/text.dart';

class DialogHelper {
  static showLoading() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetPlatform.isIOS
                  ? CupertinoActivityIndicator(radius: 20)
                  : SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.primaryColor),
                      ),
                    ),
              SizedBox(height: 30),
              Text(
                'Mohon Tunggu...',
                style: GoogleFonts.montserrat(
                    fontSize: 14, color: AppColors.blackColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static showConfirmation(
      {var iconSVG,
      var title,
      required desc,
      required onCancel,
      required onAllow,
      required cancelLabel,
      required allowLabel}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconSVG != null
                  ? Column(
                      children: [
                        SvgPicture.asset(
                          iconSVG,
                          height: 70,
                        ),
                        SizedBox(height: 24),
                      ],
                    )
                  : SizedBox(),
              title != null
                  ? Column(
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.text20Bold
                              .copyWith(color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 6),
                      ],
                    )
                  : SizedBox(),
              Text(
                desc,
                style: AppTextStyles.text16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onCancel,
                      child: Text(
                        cancelLabel,
                        style: GoogleFonts.montserrat(
                          color: AppColors.dangerColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: AppColors.dangerColor,
                        ),
                        primary: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onAllow,
                      child: Text(
                        allowLabel,
                        style: GoogleFonts.montserrat(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
