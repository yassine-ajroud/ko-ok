import 'package:equatable/equatable.dart';

class ChallengeModel extends Equatable{
String id;
String userId;
String name;
String description;
String solution;
String lien;
double rate;

ChallengeModel({required this.description,required this.id, required this.lien, required this.name, required this.rate,required this.solution,required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props =>[id,userId,name,description,solution,lien,rate];
}