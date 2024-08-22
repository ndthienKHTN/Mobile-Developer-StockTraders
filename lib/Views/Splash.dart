import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:project_login/Views/Dashboard.dart';
import 'package:project_login/Views/login_view.dart';
import 'package:logger/logger.dart';
import 'package:project_login/Services/Validators/EmailValidator.dart';
import 'package:project_login/Services/Validators/PasswordValidator.dart';
import 'package:project_login/Services/Utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_view.dart';
class SplashScreen extends StatefulWidget{
    const SplashScreen({Key? key}): super(key:key);
    @override
    State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool igLoggedIn = preferences.getBool('isLoggedIn')?? false;
      if(igLoggedIn){
        if(context.mounted){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>Dashboard()),
          );
        }
      }else{
        if(context.mounted){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>LoginPage()),
          );
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/2 - 60,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 20,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-1.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 120,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        top: 20,
                        width: 120,
                        height: 100,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png')
                              )
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

