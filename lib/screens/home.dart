import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/login.dart';
import 'package:flutter_loginpage/screens/userdetails.dart';
import 'package:flutter_loginpage/screens/userlists.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('HOME'),
        titleTextStyle: TextStyle(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                exit(context);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(names: users[index].name, times: users[index].time, avatars: users[index].avatar,)));
              },
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape:
                        (index % 2 == 0) ? BoxShape.circle : BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage(users[index].avatar),
                        fit: BoxFit.cover)),
              ),
              title: Text(users[index].name,style: TextStyle(fontFamily: "primaryFont"),),
              subtitle: Text(users[index].number),
              trailing: Text(users[index].time),
            ),
          );
        },
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }

  exit(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Do you want to exit"),
              actions: [
                TextButton(
                  onPressed: () {
                    signout(context);
                  },
                  child: const Text("Yes"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
              ],
            ));
  }
}
