import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_2/helpers/custom_text_field.dart';
import 'package:flutter_task_2/validation_cubit.dart';

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
                      child: CustomTextField(
                        isPassword: false,
                        errorText: state.emailErrorMessage,
                        onChangedText: (value) {
                          context.read<ValidationCubit>().emailText = value;
                        },
                      ),
                    ),
                    CustomTextField(
                      isPassword: true,
                      errorText: state.passwordErrorMessage,
                      onChangedText: (value) {
                        context.read<ValidationCubit>().passwordText = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 160, 0, 44),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ValidationCubit>().emailValidator();
                            context.read<ValidationCubit>().passwordValidator();
                            context.read<ValidationCubit>().onUpdated();
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
