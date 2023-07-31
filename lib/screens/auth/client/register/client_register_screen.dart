import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/navbar/bottom_navbar.dart';
import 'package:flutter_task/state_menegments/blocs/auth/auth_bloc_bloc.dart';

class ClientRegisterScreen extends StatefulWidget {
  const ClientRegisterScreen({super.key});

  @override
  State<ClientRegisterScreen> createState() => _ClientRegisterScreenState();
}

class _ClientRegisterScreenState extends State<ClientRegisterScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) async {
        if (state is CreateUserInFailury) {
          Center(
            child: Text(state.errorText),
          );
        }
        if (state is CreateUserInSuccess || state is UserSignedInSuccessfully) {
          await Future.delayed(Duration(seconds: 2));
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
              ),
               SizedBox(height: 10,),
              TextField(
                controller: passwordController,
              ),
               SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthBlocBloc>().add(CreatedUserEvent(
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text));
                  },
                  child: const Text("ADD"))
            ],
          ),
        );
      },
    );
  }
}
