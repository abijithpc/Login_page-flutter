import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  String? names;
  String? times;
  String? avatars;
  String? numbers;

  DetailsPage({this.names, this.times,this.avatars,this.numbers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(names!),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(times!), Text(names!),
        avatars !=null ? Image.network(avatars!,width: 300,height: 400,):Container(),
        ]
      )),
    );
  }
}
