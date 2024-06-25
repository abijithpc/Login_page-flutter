import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/home.dart';
import 'package:flutter_loginpage/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool isDataMatched = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('LoginPage'),
        backgroundColor: Color.fromARGB(
          255,
          39,
          42,
          43,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 100),
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/2227958/pexels-photo-2227958.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    // if (isDataMatched){
                    //   return null;
                    // }else{
                    //   return 'Error';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'Enter username';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    // if (isDataMatched){
                    //   return null;
                    // }else{
                    //   return 'Error';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'Enter password';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  children: [
                    Visibility(
                        visible: !isDataMatched,
                        child: const Text(
                          'username password doesnot match',
                          style: TextStyle(color: Colors.red),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      checklogin(context);
                    } else {
                      print('Data Empty');
                    }
                    checklogin(context);
                  },
                  icon: Icon(Icons.check),
                  label: Text(
                    'login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == password && username.isNotEmpty && password.isNotEmpty) {
      print('Usearname password match');
      // goto home

      final _SharedPrefs = await SharedPreferences.getInstance();
      await _SharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      print('Usearname password doesnt match');

      // final _errorMessage = 'username password does not match';
      // snackbar
      // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Colors.red,
      //   margin: EdgeInsets.all(10),
      //   content: Text(_errorMessage)));

      //   // Alert Dialog

      // showDialog(context: ctx, builder: (ctx1){
      // return AlertDialog(title:  Text('error'),content:  Text(_errorMessage),
      // actions: [
      //   TextButton(onPressed: (){
      //     Navigator.of(ctx1).pop();
      //   }, child: Text('close'),)
      // ],);
      // });

      // Show Text

      setState(() {
        isDataMatched = false;
      });
    }
  }
}
