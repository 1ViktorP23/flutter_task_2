import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationCubit extends Cubit<Validation> {
  ValidationCubit() : super(Validation("", "", "", ""));

  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";

  String _emailText = "";
  set emailText(String value) {
    if (_emailText != value) {
      _emailErrorMessage = "";
      onUpdated();
    }
    _emailText = value;
  }

  String _passwordText = "";
  set passwordText(String value) {
    if (_passwordText != value) {
      _passwordErrorMessage = "";
      onUpdated();
    }
    _passwordText = value;
  }

  void onUpdated() {
    return emit(
      Validation(
        _emailErrorMessage,
        _passwordErrorMessage,
        _emailText,
        _passwordText,
      ),
    );
  }

  void emailValidator() {
    if (_emailText.isEmpty) {
      _emailErrorMessage = "Please enter an email address";
    } else if (!_emailText.contains('@')) {
      _emailErrorMessage = "Please enter a valid email address";
    } else {
      _emailErrorMessage = "";
    }
  }

  void passwordValidator() {
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
  String emailErrorMessage = "error";
  String passwordErrorMessage = "error";
  String emailText = "";
  String passwordText = "";

  Validation(
    this.emailErrorMessage,
    this.passwordErrorMessage,
    this.emailText,
    this.passwordText,
  );
}
