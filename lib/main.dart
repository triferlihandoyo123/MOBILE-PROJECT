// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const LoginForm());
}
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("Login Form"),
        // ),

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/main-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              child: Column(
                children: [
                  Align(alignment: Alignment.center,),
                  SizedBox(height: 50,),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white,width: 4))),
                        child: Text("\nWELCOME",style: TextStyle(letterSpacing: 2.5, fontSize: 25,fontWeight: FontWeight.w800,color: Colors.white, fontFamily: 'bold_pw'),),
                      ),
                    ],
                  ),
                  //awal code dari form inputan      
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 450,
                    width: 350,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.yellow.withOpacity(0.5),
                      
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          alignment: Alignment.center,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatar.png'),
                                fit: BoxFit.contain,
                              ),
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'bold_pw',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1
                                  ..color = Colors.black,
                              ),
                            ),
                            Text(
                              'Username',
                              style: TextStyle(
                                fontFamily: 'bold_pw',
                                letterSpacing: 1,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3),),
                            contentPadding: EdgeInsets.fromLTRB(0,0,0,0)
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          
                        ),
                        SizedBox(height: 20,),
                        Stack(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'bold_pw',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1
                                  ..color = Colors.black,
                              ),
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontFamily: 'bold_pw',
                                letterSpacing: 1,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3),),
                            contentPadding: EdgeInsets.all(0),
                            
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white, 
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Don't Have An Account?",style: TextStyle(color: Colors.white,fontSize: 10),),
                            TextButton(
                              onPressed: (){},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.lightGreenAccent[400],
                              textColor: Colors.black,
                              child: Text('Sign In',style: TextStyle( letterSpacing: 1),),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  //akhir code dari form inputan
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}