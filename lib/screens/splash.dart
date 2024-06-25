import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/home.dart';
import 'package:flutter_loginpage/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
 
 @override
  void initState() {
    checkUserLoggedIn();
    // gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('C:/Users/abhij/Documents/login_page_flutter-master/assets/AppXplorium.jpg',height: 500,)
        ,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async{
   await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> ScreenLogin()
  
     ,)
    ,);
   }

   Future<void> checkUserLoggedIn() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    
    final UserLoggedIn =sharedPrefs.getBool(SAVE_KEY_NAME);
    if (UserLoggedIn == null || UserLoggedIn == false){
      gotoLogin();
    }else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>ScreenHome()));
    }
  }
}

