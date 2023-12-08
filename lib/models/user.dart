import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String  firstname,lastname,id,email,speciality;
 final List<dynamic> challenges;
const UserModel({required this.challenges,required this.id,required this.email,required this.firstname,required this.lastname,required this.
speciality});

  @override
  List<Object?> get props => [firstname,id,email,lastname,challenges];

  factory UserModel.fromJSON(Map<String,dynamic>json){
    return UserModel(firstname: json['firstname'],
    lastname: json['lastname'],
     id: json['id'],
     email: json['email'],
speciality:json['speciality'],
     challenges: json['challenges']??[]);
  }  

  Map<String,dynamic> toJson()=>{
    'firstname':firstname,
    'lastname':lastname,
    'id':id,
    'email':email,
    'challenges':challenges,
    'speciality':speciality
  };
}