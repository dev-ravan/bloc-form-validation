import 'package:bloc_form_validation/bloc/bloc/auth_bloc.dart';
import 'package:bloc_form_validation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          theme: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)),
              ),
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)),
          debugShowCheckedModeBanner: false,
          home: const LoginPage()),
    );
  }
}
