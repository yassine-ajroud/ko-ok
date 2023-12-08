
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/views/screens/rest_password_screen.dart';
import 'package:ko_ok/views/screens/signup_screen.dart';
import 'package:ko_ok/views/widgets/botoun.dart';
import 'package:provider/provider.dart';
import '../../controllers/signcontroller.dart';
import '../Widgets/input.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final myController1 = TextEditingController();

  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthController>(context,listen: false);
        final provider1 = Provider.of<AuthController>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [         
                    Hero(
                      tag: 'HERO',
                      child: Image.asset('assets/KOK.png',width: 250.w,fit: BoxFit.cover,)),
                    const SizedBox(height: 20,),
               const Text(style: TextStyle(
                    color: Colors.grey,
                    fontFamily:'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,         
                  ),"S'identifier"),
                    const SizedBox(height: 15,),
                     InputText(hint: "Adresse Email",type: TextInputType.emailAddress,controler: provider1.loginEmail,validator:(v)=>provider.validEmail(v??""),),
                    const SizedBox(height: 10,),
                    InputText(hint: "Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Icon(Provider.of<SigninController>(context).icon),click: () => Provider.of<SigninController>(context,listen: false).visibilite(),controler: provider1.liginPassword,validator:(v)=> provider.validPassword(v??"")),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ResetPasswordScreen()));}, child: Text('Mot de passe oublié ?',style: TextStyle(color: Colors.black,fontSize: 12.sp)
                      ,)),
                    ),
                    const SizedBox(height: 20,),
                    MyBottoun(text: 'Se connecter',click: () {
                               if(!_formKey.currentState!.validate()){
                                      return;
                        }                
                       _formKey.currentState!.save();
                      provider.login(provider1.loginEmail.text.toString(), provider1.liginPassword.text.toString(), context);
                      
                    },),
                       const SizedBox(height: 20,),   
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous n'avez pas de compte,", textAlign: TextAlign.center),
                        TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) =>  SignupScreen()));
                        }, child:const Text ('Inscrivez-vous ?',style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold),
                        ),
                    )],
                    )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }}
