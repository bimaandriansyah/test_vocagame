// ignore_for_file: constant_identifier_names, prefer_const_constructors

part of 'pages.dart';

class AppRoutes {
  static const INITIAL = AppPages.REGISTER;

  static final pages = [
    GetPage(name: _Paths.HOME, page: () => HomePage()),
    GetPage(name: _Paths.REGISTER, page: () => RegisterPage()),
    GetPage(name: _Paths.LOGIN, page: () => LoginPage()),
    GetPage(name: _Paths.ADDTASK, page: () => AddTaskPage()),
  ];
}
