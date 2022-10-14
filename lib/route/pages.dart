// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:test_hashmicro/view/add_task_page.dart';
import 'package:test_hashmicro/view/home_page.dart';
import 'package:test_hashmicro/view/login_page.dart';
import 'package:test_hashmicro/view/register_page.dart';

part 'routes.dart';

class AppPages {
  static const HOME = _Paths.HOME;
  static const REGISTER = _Paths.REGISTER;
  static const LOGIN = _Paths.LOGIN;
  static const ADDTASK = _Paths.ADDTASK;
}

abstract class _Paths {
  static const HOME = '/home';
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const ADDTASK = '/addtask';
}
