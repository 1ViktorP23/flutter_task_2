import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationCubit extends Cubit<Validation> {
  ValidationCubit() : super(Validation(false, "", "", "", ""));

  bool _isChecked = false;
  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";
  String _emailText = "";
  set emailText(String value) {
    if (_emailText != value) {
      _emailErrorMessage = "";
      isChecked(false);
    }
    _emailText = value;
  }

  String _passwordText = "";
  set passwordText(String value) {
    if (_passwordText != value) {
      _passwordErrorMessage = "";
      isChecked(false);
    }
    _passwordText = value;
  }

  void isChecked(bool isChecked) {
    _isChecked = isChecked;

    return emit(
      Validation(
        _isChecked,
        _emailErrorMessage,
        _passwordErrorMessage,
        _emailText,
        _passwordText,
      ),
    );
  }

  void emailValidator() {
    if (_isChecked) {
      _isChecked = false;
      _emailErrorMessage = "";
    }
    if (_emailText.isEmpty) {
      _emailErrorMessage = "Please enter an email address";
    } else if (!_emailText.contains('@')) {
      _emailErrorMessage = "Please enter a valid email address";
    } else {
      _emailErrorMessage = "";
    }
  }

  void passwordValidator() {
    if (_isChecked) {
      _isChecked = false;
      _emailErrorMessage = "";
    }

    if (_passwordText.isEmpty) {
      _passwordErrorMessage = "Please enter a password";
    } else if (_passwordText.length < 8) {
      _passwordErrorMessage = 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(_passwordText)) {
      _passwordErrorMessage =
          'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(_passwordText)) {
      _passwordErrorMessage =
          'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(_passwordText)) {
      _passwordErrorMessage = 'Password must contain at least one digit';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_passwordText)) {
      _passwordErrorMessage =
          'Password must contain at least one special symbol';
    } else {
      _passwordErrorMessage = "";
    }
  }
}

class Validation {
  bool isChecked = false;
  String emailErrorMessage = "error";
  String passwordErrorMessage = "error";
  String emailText = "";
  String passwordText = "";

  Validation(
    this.isChecked,
    this.emailErrorMessage,
    this.passwordErrorMessage,
    this.emailText,
    this.passwordText,
  );
}
