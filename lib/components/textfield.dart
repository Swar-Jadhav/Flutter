import 'package:flutter/material.dart';
import '../Constants.dart' as Constants;





class textfield extends StatelessWidget {
  final String text;
  final bool isPassword;
  final Function(String) onchanged;


  const textfield({
    super.key,
    required this.text,
    required this.isPassword, required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.1),
    child: TextField(
      onChanged: onchanged,
      style: TextStyle(
        color: Constants.dayPrimary
      ),
    obscureText: isPassword,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
              color: Constants.dayPrimary,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              fontSize: 20.0

          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Constants.dayPrimary,
              width: 1.8,
              style: BorderStyle.solid,
            ),
          )
      ),
    ),
    );
  }
}