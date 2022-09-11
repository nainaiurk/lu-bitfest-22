import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/consumer/authentication/login.dart';
import 'package:jatayat/firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
Color themeColor = Colors.cyan;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: themeColor),
        primarySwatch: Colors.blue,
      ),
      home: const Login()
    );
  }
}