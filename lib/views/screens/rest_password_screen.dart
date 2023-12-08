
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/views/screens/signup_screen.dart';
import 'package:ko_ok/views/widgets/botoun.dart';
import 'package:provider/provider.dart';
import '../../controllers/signcontroller.dart';
import '../Widgets/input.dart';


class ResetPasswordScreen extends StatefulWidget {
   ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthController>(context,listen: false);
        final provider1 = Provider.of<AuthController>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white10,elevation: 0,leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),),
        body: Container(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                                const SizedBox(height: 40,),
 
             const   Text(style: TextStyle(
                  color:Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily:'Roboto',
                ),"Reset Password"),
                const SizedBox(height: 40,),
                  
                 Form(
                     key: _formKey,
                  child: InputText(hint: "Email",type: TextInputType.emailAddress,controler: provider1.resetPasswordEmail,validator:(v)=>provider.validEmail(v??""),)),
                                       
                     
                const SizedBox(height: 15,),
                MyBottoun(text: 'réinitialiser le mot de passe',click: () {
                           if(!_formKey.currentState!.validate()){
                                  return;
                    }                
                   _formKey.currentState!.save();
                  provider.resetPassword( email:provider1.resetPasswordEmail.text.toString()).then((value) => Fluttertoast.showToast(
        msg: "Lien de réinitialisation de mot de passe envoyé ! vérifie ton email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ));
                  
                },),
                      
              
            ]),
          ),
        ),
      ),
    );
  }}
