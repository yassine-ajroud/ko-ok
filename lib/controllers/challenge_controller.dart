import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ko_ok/models/challenge_model.dart';

class ChallengeController with ChangeNotifier{
    CollectionReference challenges = FirebaseFirestore.instance.collection('challenges');
 
  Future<void> addChallenge()async{
 challenges
          .add(ChallengeModel)
          .then((value) => {
            Fluttertoast.showToast(
        msg: "compte créé avec succès",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ),
  } );}
}