import 'package:flutter/material.dart';
import 'package:flutter_task/data/storage/storage_repository.dart';
import 'package:flutter_task/screens/admin/navbar/admin_navbar.dart';
import 'package:flutter_task/screens/navbar/bottom_navbar.dart';
import 'package:flutter_task/screens/option/option_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    onNextpage();
    super.initState();
  }

  onNextpage() {
    Future.delayed(const Duration(seconds: 20), () async {
      String response = await StorageRepository.getUserId();
      debugPrint("++++++++++++++++BU RESPONSE++++++++$response");
      if (response.isEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OptionScreen(),
            ));
      } 
      else if(response=="91ldzGFUU1gEKKYmB3aOotSGhKz1"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => AdminNavbar(),));
      }
      else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBar(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/splash.jpg")),
    );
  }
}
