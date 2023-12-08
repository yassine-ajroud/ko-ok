import 'package:equatable/equatable.dart';

class ChallengeModel extends Equatable{
String id;
String userId;
String name;
String description;
String solution;
String lien;
double rate;
String language;

ChallengeModel({required this.language ,required this.description,required this.id, required this.lien, required this.name, required this.rate,required this.solution,required this.userId});
  @override
  List<Object?> get props =>[id,userId,name,description,solution,lien,rate];
  factory ChallengeModel.fromJSON(Map<String,dynamic>json){
    return ChallengeModel(language: json['language'],description: json['description'], id: json['id'], lien: json['lien'], name: json['name'], rate: json['rate'], solution: json['solution'], userId: json['userId']);
  }  

  Map<String,dynamic> toJson()=>{
    'userId':userId,
    'description':description,
    'lien':lien,
    'name':name,
    'solution':solution,
    'rate':rate,
    'language':language
  };

}