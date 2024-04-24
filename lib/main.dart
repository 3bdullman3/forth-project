import 'package:flutter/material.dart';
import 'package:main/layout/homelayout.dart';
import 'package:main/modules/bmi_result/bmi_result_page.dart';
import 'package:main/modules/bmi/calc_page.dart';
import 'package:main/modules/login/login.dart';
import 'package:main/modules/messenger/messenger.dart';
import 'package:main/modules/users/usres.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}