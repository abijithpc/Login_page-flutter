import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/home.dart';
import 'package:flutter_loginpage/screens/signup.dart';
import 'package:flutter_loginpage/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;
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
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 200),
                  const Column(
                    children: [
                      Center(
                        child: Text("Welcome Back",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 82, 232),
                                fontSize: 35)),
                      ),
                      Center(
                        child: Text("Log In To Your Account",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ),
                    ],
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
                          visible: !_isDataMatched,
                          child: const Text(
                            'username password doesnot match',
                            style: TextStyle(color: Colors.red),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        checklogin(context);
                      } else {
                        print('Data Empty');
                      }
                      checklogin(context);
                    },
                    child: Center(child: Text("Login")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 25,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    const Color.fromARGB(255, 250, 248, 248)),
                          ))),
                ],
              ),
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

      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
