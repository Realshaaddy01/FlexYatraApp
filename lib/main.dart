import 'package:firebase_core/firebase_core.dart';
import 'package:flexyatra_app/Presentations/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'Presentations/startingPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Yatra',
      theme: ThemeData(
        primarySwatch: Colors.green,
        ),
      home: StartingPage(),
    );
  }
}
