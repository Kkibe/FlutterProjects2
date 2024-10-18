import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_fitness/firebase_options.dart';
import 'package:health_fitness/routes.dart';
import 'package:health_fitness/utils/app_colors.dart';
import 'package:health_fitness/utils/auth_provider.dart';
import 'package:health_fitness/view/dashboard/dashboard_screen.dart';
import 'package:health_fitness/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:health_fitness/view/welcome/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// connect it to firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Plus',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor1,
          useMaterial3: true,
          fontFamily: "Poppins"),
      home: _auth.currentUser != null ? DashboardScreen() : StartScreen(),
    );
  }
}
