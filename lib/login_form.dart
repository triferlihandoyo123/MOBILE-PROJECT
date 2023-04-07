// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ui';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _eyeIcon = false;


  @override
  void initState() {
    super.initState();
    _passwordController.clear();
    _usernameController.clear();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appbar : AppBar(),
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
                        child: Text("\nLOGIN",style: TextStyle(letterSpacing: 2.5,fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white,),),
                      ),
                    ],
                  ),
                  //awal code dari form inputan      
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 470,
                    width: 320,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white, width: 2),
                      color: Colors.black.withOpacity(0.1),    
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
                                scale: 13
                              ),
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(50),   
                            ),
                          ),
                        ),
                        Text(
                          'Username',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: "Username...",
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.4),fontSize: 15),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3),),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          
                          textAlignVertical: TextAlignVertical.center,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Password',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_eyeIcon,
                          decoration: InputDecoration(
                            hintText: "Password...",
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.4),fontSize: 15),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _eyeIcon = !_eyeIcon;
                                });
                              },
                              child: Icon(
                                _eyeIcon ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          textAlignVertical: TextAlignVertical.center,
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
                              onPressed: () {
                                Navigator.pushNamed(context, '/scroll');
                                _passwordController.clear();
                                _usernameController.clear();
                              },
                              color: Colors.black,
                              textColor: Colors.black,
                              child: Text('Sign In',style: TextStyle(color: Colors.white, letterSpacing: 1),),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                       
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