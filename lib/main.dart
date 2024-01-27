import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phoneauth_firebase/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid == true
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCHrlTaaYtdphFa21xxHP_1UO9nMU6--ZM",
              appId: "1:157576590275:android:5bf297c493bc6f87be4376",
              messagingSenderId: "157576590275",
              projectId: "phone-auth-flutter-696ff"),
        )
      : await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      // title: "FlutterPhoneAuth",
    );
  }
}
