
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/home_screen.dart';


Drawer sideDrawer() {
  return Drawer(
    // backgroundColor: Colors.black12,
    child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Pokemon",
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        ),

        Row(
          children: [
            MaterialButton(
              child: const Text(
                "Pokemon List",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () async {
                Get.offAll(() => const HomeScreen());
              },
            ),
          ],
        ),
        Row(
          children: [
            MaterialButton(
              child: const Text(
                "SignOut",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () async {
              },
            ),
          ],
        ),

        ///ListTile(title: Text("Close"), onTap: () => Get.back()),
      ],
    ),
  );
}
