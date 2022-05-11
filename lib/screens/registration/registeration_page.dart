import 'package:flutter/material.dart';
import 'package:flutter_task/controller/firebase_auth_provider.dart';
import 'package:flutter_task/screens/login/login_page.dart';
import 'package:provider/provider.dart';


class RegisterationPage extends StatefulWidget {
  const RegisterationPage({ Key? key }) : super(key: key);

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please SignUP',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(
              // color: Colors.red,
              padding: EdgeInsets.all(22),
              child: Column(
                children: [
                  TextField(
                    controller: _emailField,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordField,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 16),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                       final model = context.read<AuthProvider>();
                      
                      await model.signUp(
                          email: _emailField.text,
                          password: _passwordField.text).then((value){
                            Navigator.pop(context);
                          });
                    },
                    child: Text('Sign Up'),
                  )
                ],
              ),
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    },
                    child: Text("Sign In")),
              ],
            )
          ]),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () async {
      //       final model = context.read<AuthProvider>();
      //       await model.signIn(email: 'test@test.com', password: 'test1234');
      //     },
      //     child: Text('Sign in'),
      //   )),
    );
  }
}