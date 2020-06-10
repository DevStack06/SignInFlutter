import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<bool> _pass = [true];
  final passText = TextEditingController();
  final userText = TextEditingController();
  final userGlobalKey = GlobalKey<FormState>();
  final passGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotateAnimatedTextKit(
                    onTap: () {
                      print("Tap Event");
                    },
                    totalRepeatCount: 500,
                    text: ["Get Ready !", "Get Onboard !", "Get Freind !"],
                    textStyle: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 40.0,
                        fontFamily: "Horizon",
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot password ?",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            borderContainer(inputField("Username or Email"), userGlobalKey),
            borderContainer(passInputField("Password", 0), passGlobalKey),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (userGlobalKey.currentState.validate() &&
                    passGlobalKey.currentState.validate()) {
                  print("validated login");
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 150,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create a new account",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignUp()));
                  },
                  child: Text("Sign Up",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget borderContainer(Widget child, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
      child: Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.amberAccent,
                width: 4,
              )),
          child: Form(key: key, child: child)),
    );
  }

  Widget inputField(String hintText) {
    return TextFormField(
      controller: userText,
      validator: (value) {
        if (value.isEmpty) return "Username can not be empty";
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 18,
        ),
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }

  Widget passInputField(String hintText, int index) {
    return TextFormField(
      controller: passText,
      validator: (value) {
        if (value.isEmpty) return "password can not be empty";
        return null;
      },
      obscureText: _pass[index],
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 18,
        ),
        suffixIcon: IconButton(
            icon: _pass[index]
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () => {
                  setState(() {
                    _pass[index] = !_pass[index];
                  })
                }),
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}
