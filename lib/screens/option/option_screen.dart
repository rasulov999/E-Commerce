import 'package:flutter/material.dart';
import 'package:flutter_task/screens/auth/client/register/client_register_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientRegisterScreen()));
            }, child: Text("Client")),
            ElevatedButton(onPressed: () {}, child: Text("Admin"))
          ],
        ),
      ),
    );
  }
}
