import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationState extends Equatable {
  final String emailErrorMessage;
  final String passwordErrorMessage;
  final String emailText;
  final String passwordText;

  ValidationState({
    this.emailErrorMessage = "",
    this.passwordErrorMessage = "",
    this.emailText = "",
    this.passwordText = "",
  });

  ValidationState copyWith({
    String? emailErrorMessage,
    String? passwordErrorMessage,
    String? emailText,
    String? passwordText,
  }) {
    return ValidationState(
      emailErrorMessage: emailErrorMessage ?? this.emailErrorMessage,
      passwordErrorMessage: passwordErrorMessage ?? this.passwordErrorMessage,
      emailText: emailText ?? this.emailText,
      passwordText: passwordText ?? this.passwordText,
    );
  }

  @override
  List<Object?> get props => [
    emailErrorMessage,
    passwordErrorMessage,
    emailText,
    passwordText,
  ];
}

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationState());

  void emailText(String value) {
    if (state.emailText != value) {
      emit(state.copyWith(emailErrorMessage: ""));
    }
    emit(state.copyWith(emailText: value));
  }

  void passwordText(String value) {
    if (state.passwordText != value) {
      emit(state.copyWith(passwordErrorMessage: ""));
    }
    emit(state.copyWith(passwordText: value));
  }

  void emailValidator() {
    print(state.emailText);
    if (state.emailText.isEmpty) {
      emit(state.copyWith(emailErrorMessage: "Please enter an email address"));
    } else if (!RegExp(
      r'^[\w-]+@[\w-]+\.[a-z]{2,}$',
    ).hasMatch(state.emailText)) {
      emit(
        state.copyWith(emailErrorMessage: "Please enter a valid email address"),
      );
    } else {
      emit(state.copyWith(emailErrorMessage: ""));
    }
  }

  void passwordValidator() {
    if (state.passwordText.isEmpty) {
      emit(state.copyWith(passwordErrorMessage: "Please enter a password"));
    } else if (state.passwordText.length < 8) {
      emit(
        state.copyWith(
          passwordErrorMessage: 'Password must be at least 8 characters',
        ),
      );
    } else if (!RegExp(r'[A-Z]').hasMatch(state.passwordText)) {
      emit(
        state.copyWith(
          passwordErrorMessage:
              "Password must contain at least one uppercase letter",
        ),
      );
    } else if (!RegExp(r'[a-z]').hasMatch(state.passwordText)) {
      emit(
        state.copyWith(
          passwordErrorMessage:
              "Password must contain at least one lowercase letter",
        ),
      );
    } else if (!RegExp(r'[0-9]').hasMatch(state.passwordText)) {
      emit(
        state.copyWith(
          passwordErrorMessage: "Password must contain at least one digit",
        ),
      );
    } else if (!RegExp(
      r'[!@#$%^&*(),.?":{}|<>]',
    ).hasMatch(state.passwordText)) {
      emit(
        state.copyWith(
          passwordErrorMessage:
              "Password must contain at least one special symbol",
        ),
      );
    } else {
      emit(state.copyWith(passwordErrorMessage: ""));
    }
  }
}
