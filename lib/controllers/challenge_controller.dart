import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ko_ok/controllers/authentication_controller.dart';
import 'package:ko_ok/models/challenge_model.dart';
import 'package:provider/provider.dart';

class ChallengeController with ChangeNotifier{

List<ChallengeModel> challengesList=[];

    CollectionReference challenges = FirebaseFirestore.instance.collection('challenges');
 
  Future<void> addChallenge(ChallengeModel challenge)async{
 final res = await challenges 
          .add(challenge.toJson());
  
 await challenges
    .doc(res.id) // <-- Doc ID where data should be updated.
    .update({'id' : res.id}) // <-- Updated data
    .then((_) => print('Updated'))
    .catchError((error) => print('Update failed: $error'));
  
  }

Future<void> getAllChanllenges(BuildContext context)async {
   QuerySnapshot querySnapshot = await challenges.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    challengesList= allData.map((e) => ChallengeModel.fromJSON(e as Map<String,dynamic>)).toList().where((element) => element.language==Provider.of<AuthController>(context,listen: false).currentUser.speciality).toList();

}

}