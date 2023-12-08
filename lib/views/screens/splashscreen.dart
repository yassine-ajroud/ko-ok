import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/controllers/theme_controller.dart';
import 'package:ko_ok/views/screens/add_challege_sceen.dart';
import 'package:ko_ok/views/screens/home_screen.dart';
import 'package:ko_ok/views/screens/login_screen.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{
  @override
 void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),() async{
      await Provider.of<ThemeController>(context,listen: false).loadTheme();
FirebaseAuth.instance
  .userChanges()
  .listen((User? user) async{
    if (user == null) {
    await  Provider.of<AuthController>(context,listen: false).getCurrentUser();
       Provider.of<AuthController>(context).userId = user!.uid;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) =>  LoginScreen()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) =>  AddChallengeScreen()));
    }
  });

  });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const SizedBox(height: 20,),
          Image.asset('assets/KOK.png',width: 200.w,),
          const SizedBox(height: 30,),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          
          
          ),
          const SizedBox(height: 20,),
          const Text("Chargement",textAlign: TextAlign.center,style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold),)
          
          
        ],
        ),
      ),
      

    );
  }
}
