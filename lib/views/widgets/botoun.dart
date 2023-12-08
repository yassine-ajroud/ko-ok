
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottoun extends StatelessWidget {
  
  final String text ;
  final void Function() click;
  const MyBottoun({super.key, required this.text ,required this.click});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 200.w,
                height: 40.h,
                child: ElevatedButton(onPressed:click,style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.green),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color:Colors.green)
                  )
                )), child: Text(text,style: const TextStyle (color:Colors.white,fontWeight: FontWeight.bold))
                ),
              )
      

    ;
  }
}