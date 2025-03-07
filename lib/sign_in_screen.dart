import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_2/helpers/outline_input_border_extension.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: BlocProvider(
        create: (_) => ValidationCubit(),
        child: BlocBuilder<ValidationCubit, Validation>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: SizedBox(
                        width: double.infinity,
                        height: 72,
                        child: TextFormField(
                          decoration: InputDecoration(
                            errorText:
                                state.isChecked
                                    ? state.emailErrorMessage
                                    : null,
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            errorBorder: CustomOutlineBorder.customOutline(),
                            focusedErrorBorder:
                                CustomOutlineBorder.customOutline(),
                            focusedBorder: CustomOutlineBorder.customOutline(),
                            enabledBorder: CustomOutlineBorder.customOutline(),
                            labelText: "Email",
                          ),
                          onChanged: (value) {
                            context.read<ValidationCubit>().emailValidator(
                              value,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 72,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText:
                              state.isChecked
                                  ? state.passwordErrorMessage
                                  : null,
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          errorBorder: CustomOutlineBorder.customOutline(),
                          focusedErrorBorder:
                              CustomOutlineBorder.customOutline(),
                          focusedBorder: CustomOutlineBorder.customOutline(),
                          enabledBorder: CustomOutlineBorder.customOutline(),
                          labelText: "Password",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 200, 0, 44),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ValidationCubit>().isChecked(true);
                          },
                          child: Text(
                            "Sing in",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ValidationCubit extends Cubit<Validation> {
  ValidationCubit() : super(Validation(false, "", ""));

  bool _isChecked = false;
  String _emailErrorMessage = "Please enter an email address";
  String _passwordErrorMessage = "Please enter a password";

  void isChecked(bool isChecked) {
    _isChecked = isChecked;
    return emit(
      Validation(isChecked, _emailErrorMessage, _passwordErrorMessage),
    );
  }

  void emailValidator(String? value) {
    if (_isChecked) {
      _isChecked = false;
    }
    if (value == null || value.isEmpty) {
      _emailErrorMessage = "Please enter an email address";
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }

    if (!value!.contains('@')) {
      _emailErrorMessage = "Please enter a valid email address";
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }
  }

  void passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      _passwordErrorMessage = "Please enter a password";
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }

    if (value!.length < 8) {
      _passwordErrorMessage = 'Password must be at least 8 characters';
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      _passwordErrorMessage =
          'Password must contain at least one uppercase letter';
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      _passwordErrorMessage =
          'Password must contain at least one lowercase letter';
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      _passwordErrorMessage = 'Password must contain at least one digit';
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      _passwordErrorMessage =
          'Password must contain at least one special symbol';
      emit(Validation(_isChecked, _emailErrorMessage, _passwordErrorMessage));
    }
  }
}

class Validation {
  bool isChecked = false;
  String emailErrorMessage = "error";
  String passwordErrorMessage = "error";

  Validation(this.isChecked, this.emailErrorMessage, this.passwordErrorMessage);
}
