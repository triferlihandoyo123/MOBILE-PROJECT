// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// Tri Ferli Handoyo
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';



class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _eyeIcon = false;


  void login() async {
  // Mengirim HTTP GET request ke URL tertentu
  final url = Uri.parse('http://192.168.43.181:8080/login_test/login.php');
  final body = {
    'username': _usernameController.text,
    'password': _passwordController.text
  };
  try {
    final response = await http.post(
      url,
      body: body,
    );
    final data = jsonDecode(response.body);
    if (data['success'] ==true) {
      print("login Berhasil");
    } else {
      print('username atau password salah');
    }
  }catch(error){
    print(error);
  }
}


  @override
  void initState() {
    super.initState();
    _passwordController.clear();
    _usernameController.clear();
  }

  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // atur transparan
      statusBarBrightness: Brightness.dark, // atur kecerahan
      systemStatusBarContrastEnforced:true,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appbar : AppBar(),
        body: SafeArea(
          child: ListView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main-background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 4))),
                            child: Text(
                              "\nLOGIN",
                              style: TextStyle(
                                letterSpacing: 2.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //awal code dari form inputan
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 470,
                        width: 320,
                        margin: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.withAlpha(5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                                      image: AssetImage(
                                          'assets/images/avatar.png'),
                                      scale: 13),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
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
                            Container(
                              height: 30,
                              child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: "Username...",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 15),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 30,
                              child: TextField(
                                controller: _passwordController,
                                obscureText: !_eyeIcon,
                                decoration: InputDecoration(
                                  hintText: "Password...",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 15),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 3)),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _eyeIcon = !_eyeIcon;
                                      });
                                    },
                                    child: Icon(
                                      _eyeIcon
                                          ? Icons.visibility
                                          : Icons.visibility_off,
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Don't Have An Account?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    login();
                                    _passwordController.clear();
                                    _usernameController.clear();
                                  },
                                  color: Color.fromARGB(255, 72, 136, 0),
                                  textColor: Colors.black,
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.white, letterSpacing: 1),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                        width: 2, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
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
          ],
        ),
      ),
      ),
    );
  }
}
