import 'package:face_test/login.dart';
import 'package:face_test/verify.dart';
import 'package:flutter/material.dart';

void main() async
    {
     runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => login(),
      '/x': (context) =>  verification(),
    }
));
    }

