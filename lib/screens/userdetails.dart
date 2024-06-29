import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  String? names;
  String? times;
  String? avatars;
  String? numbers;

  DetailsPage({this.names, this.times, this.avatars, this.numbers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(names!),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(times!),
        Text(names!),
        avatars != null
            ? Image.network(
                avatars!,
                width: 300,
                height: 400,
              )
            : Container(),
      ])),
    );
  }

  signout(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
