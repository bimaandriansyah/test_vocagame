// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';

import 'package:test_hashmicro/constant/color.dart';
import 'package:test_hashmicro/constant/text.dart';

class CustomTextFieldV2 extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  final String hint;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;
  final bool? isShow;
  final FormFieldValidator<String>? validation;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;
  const CustomTextFieldV2({
    Key? key,
    this.controller,
    this.onTap,
    required this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly,
    this.isShow,
    this.validation,
    this.keyboardType,
    this.inputAction,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      onTap: onTap,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      keyboardType: keyboardType,
      obscureText: isShow ?? false,
      textInputAction: inputAction,
      validator: validation,
      decoration: InputDecoration(
        errorStyle: AppTextStyles.text12.copyWith(color: AppColors.whiteColor),
        hintText: hint,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: AppColors.darkGreyColor, fontSize: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            const Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            const Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            const Radius.circular(8),
          ),
        ),
        fillColor: AppColors.whiteColor,
        filled: true,
        focusColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}
