// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';


class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _id_usercontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _eyeIcon = false;

  void register() async {
  // Mengirim HTTP GET request ke URL tertentu
  final url = Uri.parse('http://192.168.43.181:8080/login_test/register.php');
  final body = {
    'id_user': _id_usercontroller.text,
    'name': _namecontroller.text,
    'username': _usernameController.text,
    'password': _passwordController.text
  };
  try {
    final response = await http.post(url,body: body,);
    if (jsonDecode(response.body)['success'] == true) {
      print("register berhasil, silahkan login");
    } else {
      print('register tidak berhasil');
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
    final screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        //appbar : AppBar(),
        body: SafeArea(
          child: ListView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main-background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Color.fromARGB(255, 142, 199, 101).withAlpha(5),
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 4))),
                            child: Text(
                              "REGISTER",
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
                        height: 590,
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
                              'User Id',
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
                                controller: _id_usercontroller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  hintText: "User Id...",
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
                                textAlignVertical: TextAlignVertical.top,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Name',
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
                                controller: _namecontroller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  hintText: "Name...",
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
                                textAlignVertical: TextAlignVertical.top,
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  hintText: "Username...",
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
                                textAlignVertical: TextAlignVertical.top,
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
                                  "Have An Account?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Text(
                                    "Sign In",
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
                                    Navigator.pushNamed(context, '/');
                                 
                                    register();
                                  },
                                  color: Color.fromARGB(255, 72, 136, 0),
                                  textColor: Colors.black,
                                  child: Text(
                                    'Sign Up',
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
