import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_2/sign_in_cubit.dart';
import 'package:flutter_task_2/sign_in_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ValidationCubit(),
      child: MaterialApp(home: SignInScreen()),
    ),
  );
}
