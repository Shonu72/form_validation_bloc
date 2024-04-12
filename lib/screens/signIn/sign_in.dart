import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/signIn/bloc/login_bloc.dart';
import 'package:form_validation/screens/signIn/bloc/login_event.dart';
import 'package:form_validation/screens/signIn/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginTextChangedEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginTextChangedEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: (state is LoginValidState)
                          ? MaterialStateProperty.all(Colors.deepPurple)
                          : MaterialStateProperty.all(Colors.grey),
                    ),
                    onPressed: () {
                      if (state is LoginValidState) {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginTextSubmittedEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
