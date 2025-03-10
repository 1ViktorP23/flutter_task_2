import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_2/helpers/custom_text_field.dart';
import 'package:flutter_task_2/validation_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  // bool isKeyboardOpen(BuildContext context) {
  //   return MediaQuery.of(context).viewInsets.bottom > 0;
  // }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    double bottomPadding = isKeyboardOpen ? 0 : 44;
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 68.0),
                      child: CustomTextField(
                        isPassword: true,
                        errorText: state.passwordErrorMessage,
                        onChangedText: (value) {
                          context.read<ValidationCubit>().passwordText = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: bottomPadding),
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
