import 'package:flutter/material.dart';

extension CustomOutlineBorder on OutlineInputBorder {
  static OutlineInputBorder customOutline() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
