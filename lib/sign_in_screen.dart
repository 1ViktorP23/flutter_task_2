import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_2/helpers/custom_text_field.dart';
import 'package:flutter_task_2/sign_in_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double emptySpaceHeight = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                SizedBox(height: emptySpaceHeight),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: BlocBuilder<ValidationCubit, ValidationState>(
                    buildWhen:
                        (final previous, final current) =>
                            previous.emailText != current.emailText ||
                            previous.emailErrorMessage !=
                                current.emailErrorMessage,
                    builder: (context, state) {
                      return CustomTextField(
                        isPassword: false,
                        errorText: state.emailErrorMessage,
                        onChangedText: (value) {
                          context.read<ValidationCubit>().emailText(value);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 68.0),
                  child: BlocBuilder<ValidationCubit, ValidationState>(
                    buildWhen:
                        (final previous, final current) =>
                            previous.passwordText != current.passwordText ||
                            previous.passwordErrorMessage !=
                                current.passwordErrorMessage,
                    builder: (context, state) {
                      return CustomTextField(
                        isPassword: true,
                        errorText: state.passwordErrorMessage,
                        onChangedText: (value) {
                          context.read<ValidationCubit>().passwordText(value);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 44),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ValidationCubit>().emailValidator();
                        context.read<ValidationCubit>().passwordValidator();
                      },
                      child: Text("Sing in", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
