import 'package:bloc_form_validation/bloc/bloc/auth_bloc.dart';
import 'package:bloc_form_validation/pages/components/my_button.dart';
import 'package:bloc_form_validation/pages/components/my_field.dart';
import 'package:bloc_form_validation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //

  final formKey = GlobalKey<FormState>();
  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
        if (state is AuthSuccessState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyField(hint: "Email", controller: emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  MyField(hint: "Password", controller: passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  MyButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                              AuthLoginButtonClickEvent(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()));
                        }
                      },
                      title: "Login")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
