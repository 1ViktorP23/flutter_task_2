import 'package:flutter/material.dart';
import 'package:flutter_task_2/helpers/outline_input_border_extension.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final String errorText;
  final Function(String) onChangedText;

  const CustomTextField({
    required this.isPassword,
    required this.errorText,
    required this.onChangedText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 76,
      child: TextFormField(
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
          errorText: errorText,
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorBorder: CustomOutlineBorder.customOutline(),
          focusedErrorBorder: CustomOutlineBorder.customOutline(),
          focusedBorder: CustomOutlineBorder.customOutline(),
          enabledBorder: CustomOutlineBorder.customOutline(),
          labelText: isPassword ? "Password" : "Email",
          labelStyle: TextStyle(color: Colors.black),
        ),
        onChanged: (value) {
          onChangedText(value);
        },
      ),
    );
  }
}
