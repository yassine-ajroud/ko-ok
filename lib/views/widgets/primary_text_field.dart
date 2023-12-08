import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final int minLines,maxLines;
  final String hint;
  final TextEditingController controller;
 const  PrimaryTextField({super.key, required this.controller,required this.hint,required this.maxLines,required this.minLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLines,
       maxLines: maxLines,
      controller: controller,
    keyboardType:TextInputType.text,
      decoration: InputDecoration(
    filled: true, //<-- SEE HERE
    fillColor: const Color.fromARGB(172, 136, 192, 87), //<-- SEE HERE

        hintText:hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(color:Color.fromARGB(59, 55, 121, 57),
              width: 2.0)
            ),
            enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:const BorderSide(
                   color:Color.fromARGB(19, 55, 121, 57),
                    width: 2.0,
                  ),
          ),
    ));
  }
}