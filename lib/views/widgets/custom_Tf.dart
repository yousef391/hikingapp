

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class custom_TF extends StatelessWidget {
   custom_TF({
    required this.hint,
    super.key,
    this.maxLines,
    this.controller,
    required this.password,
    this.validator,
    required this.keyboard
    
  });
  
  final hint;
  bool password;
  String? Function(String?)? validator;
  int? maxLines=1;
  TextEditingController? controller;
  TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8 ),
      child: TextFormField(
        obscureText: password,
        
        controller: controller ,
        validator: validator,
        maxLines: maxLines,
        keyboardType: keyboard,
        decoration: InputDecoration(
          
            fillColor: const Color(0xff5F6F52).withOpacity(0.1),
            hintStyle: const  TextStyle(color: Color(0xff5F6F52), fontSize: 13 ,),
            filled: true,
            
            hintText: hint,
            border: borderdec(),
            enabledBorder: borderdec(),
            focusedBorder: borderdec(),
            disabledBorder: borderdec()),
      ),
    );
  }

  OutlineInputBorder borderdec() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.transparent));
  }
}