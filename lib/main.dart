// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:loginform/register_form.dart';

import 'login_form.dart';
import 'package:flutter/material.dart';
import 'contoh_scroll.dart';
void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/scroll': (context) => ContohScroll(),
        '/register' : (context) => RegisterForm(),
      },
    ));
