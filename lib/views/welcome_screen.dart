import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../services/internet_connection.dart';
import 'home_screen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),() async {
      final connectivityResult = await InternetConnection.isConnectedToInternet();
      if (connectivityResult) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar(
          'Attention!!',
          'Please check your internet connection.',
          colorText: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
        );
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  'Pokemon',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
             child: Image.asset(
               "images/bullbasaur.png",
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
