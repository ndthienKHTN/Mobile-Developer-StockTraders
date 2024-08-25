import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_login/Views/Screen/Dashboard.dart';
import 'package:project_login/Views/Splash/Splash.dart';
import 'package:provider/provider.dart';
import 'Services/Websocket/Websocket_service.dart';
import 'Views/Screen/Login.dart';
import 'Views/Screen/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StockService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

