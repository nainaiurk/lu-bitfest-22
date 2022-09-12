import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/firebase_options.dart';
import 'package:jatayat/transport_dept/input_transport_demand.dart';
import 'package:jatayat/transport_dept/request_data.dart';
import 'package:jatayat/transport_dept/update_bus_inventory.dart';
import 'package:jatayat/welcome_page.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: themeColor),
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage()
    );
  }
}