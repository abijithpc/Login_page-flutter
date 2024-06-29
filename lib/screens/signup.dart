import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Sign Up",style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 83, 76, 76),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Sign Up Page",style: TextStyle(color:Color.fromARGB(255, 87, 82, 232),fontSize: 35 ),textAlign: TextAlign.start,),
              Text("Create a New Account",style: TextStyle(color: Colors.white,fontSize:20 ),),
              SizedBox(height: 30,),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email Id",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Re-enter Password",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
              ElevatedButton(onPressed: () {}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
