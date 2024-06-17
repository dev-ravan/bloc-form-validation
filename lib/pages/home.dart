import 'package:bloc_form_validation/bloc/bloc/auth_bloc.dart';
import 'package:bloc_form_validation/pages/components/my_button.dart';
import 'package:bloc_form_validation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HOME",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              MyButton(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogoutButtonClickEvent());
                  },
                  title: "Log out")
            ],
          ),
        ),
      ),
    );
  }
}
