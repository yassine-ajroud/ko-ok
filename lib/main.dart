import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/controllers/signcontroller.dart';
import 'package:ko_ok/controllers/theme_controller.dart';
import 'package:ko_ok/views/screens/login_screen.dart';
import 'package:ko_ok/views/screens/splashscreen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SigninController()),
      ChangeNotifierProvider(create: (context) => ThemeController()),
      ChangeNotifierProvider(create: (context) => AuthController()),


    ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
            designSize: const Size(375, 812),
      builder: (_, __) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  SplashScreen(),
      ),
    );
  }
}