
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/views/screens/login_screen.dart';
import 'package:ko_ok/views/widgets/dialog.dart';
import 'package:provider/provider.dart';


import '../../controllers/signcontroller.dart';

import '../widgets/botoun.dart';
import '../widgets/input.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthController>(context,listen: false);
        final provider1 = Provider.of<AuthController>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _formKey,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [         
                     Hero(
                      tag: "HERO",
                      child: Image.asset('assets/KOK.png',width: 150.w,fit: BoxFit.cover,)),
                    const SizedBox(height: 20,),
                        
                const Text(style: TextStyle(
                    color: Colors.grey,
                    fontFamily:'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,         
                  ),"s'inscrire"),
                    const SizedBox(height: 6,),
                     InputText(hint: "Nom",controler: provider1.fname,validator: (v)=>provider.validuserName(v??""),),
                    const SizedBox(height: 6,),
                    InputText(hint: "prénom",controler: provider1.lname,validator: (v)=>provider.validuserName(v??""),),
                    const SizedBox(height: 6,),
                    InputText(hint: "spécialité",controler: provider1.spc,validator: (v)=>provider.validuserName(v??""),),
                    const SizedBox(height: 6,),
                     InputText(hint: "Adresse Email",type: TextInputType.emailAddress,controler: provider1.eml,validator: (v)=>provider.validEmail(v??"")),
                    const SizedBox(height: 6,),
                    InputText(hint: "Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Icon(Provider.of<SigninController>(context).icon),click: () => Provider.of<SigninController>(context,listen: false).visibilite(),controler: provider1.psw,validator: (v)=>provider.validPassword(v??""),),
                    const SizedBox(height: 6,),
                    InputText(hint: "Confirmer Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Icon(Provider.of<SigninController>(context).icon),click: () => Provider.of<SigninController>(context,listen: false).visibilite(),controler: provider1.cpsw,validator: (v)=>provider.validCPassword(v??"",provider1.psw.text.toString()),),
                    Row(
                    children:[
                      
                      Checkbox(activeColor:Colors.green, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),value:Provider.of<SigninController>(context).check, onChanged:(value)=>Provider.of<SigninController>(context,listen: false).checking(value),
                      
                      
                        
                       ),
                      const Text("J'ai lu et j'accepte"),
                      TextButton(onPressed: (){
                        showDialog(context: context, builder: (_) =>const MyDialog());
                      }, child:const Text ("les termes et les conditions.",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),)
                        
                      
                      
                    
                    ],),
                    MyBottoun(text: 'Enregistrer',click: () async{
                                  if(!_formKey.currentState!.validate()){
                                    return;
                      }        
                      if(!Provider.of<SigninController>(context,listen: false).check){
Fluttertoast.showToast(
        msg: "tu dois accepter les terms et les conditions",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return;
                      }         
                           _formKey.currentState!.save();

                     await provider.createAccount(provider1.eml.text.toString(), provider1.psw.text.toString(), provider1.fname.text.toString(), provider1.lname.text.toString(),provider1.spc.text.toString()).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginScreen())));

                    },),
                   
                      
                    const SizedBox(height: 1,),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6,),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Connecter a votre compte,", textAlign: TextAlign.center),
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child:const Text ("S'identifier ?",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                          ),
                      )],
                      ),
                    )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}