import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/controllers/challenge_controller.dart';
import 'package:ko_ok/controllers/theme_controller.dart';
import 'package:ko_ok/models/challenge_model.dart';
import 'package:ko_ok/views/widgets/botoun.dart';
import 'package:ko_ok/views/widgets/primary_text_field.dart';
import 'package:provider/provider.dart';

class AddChallengeScreen extends StatelessWidget {
   AddChallengeScreen({super.key});

  final TextEditingController challengeController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
  final TextEditingController solutionController = TextEditingController();
  final TextEditingController lienController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      appBar: AppBar(
        title:const Text('Ajouter un Défis',style: TextStyle(color: Colors.black),),
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
        centerTitle: true,
        flexibleSpace: Image(
          image: AssetImage('assets/${Provider.of<ThemeController>(context).theme.appBarImage}'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body:Stack(
        children: [Image.asset('assets/${Provider.of<ThemeController>(context).theme.backgroundImage}',fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            PrimaryTextField(controller: challengeController, hint: "Défis", maxLines: 3, minLines: 1),
           const SizedBox(height: 20,),
                      PrimaryTextField(controller: descriptionController, hint: "Description", maxLines: 7, minLines: 3),
                              const  SizedBox(height: 20,),
                      PrimaryTextField(controller: solutionController, hint: "Solution", maxLines: 9, minLines: 5),    
                              const  SizedBox(height: 20,),
                            PrimaryTextField(controller: lienController, hint: "Lien", maxLines: 3, minLines: 1),
                           const SizedBox(height: 40,),
          MyBottoun(text: 'Ajouter', click: ()async{
            if(challengeController.text!=""&&descriptionController.text!=""&&solutionController.text!=""&&lienController.text!=""){
                          await Provider.of<ChallengeController>(context,listen: false).addChallenge(ChallengeModel(description: descriptionController.text, id: '', lien: lienController.text, name: challengeController.text, rate: 0.0, solution: solutionController.text, userId: Provider.of<AuthController>(context,listen: false).userId,language:Provider.of<AuthController>(context,listen: false).currentUser.speciality ));
            }else{
               Fluttertoast.showToast(
        msg: "il faut remplir tous les champs",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
            }
          })
        
        
          ],),
        ),
      )
      ],) ,
    )
    );
  }
}