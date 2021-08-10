
import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foosion_admin/services/firebase_services.dart';

import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login-screen';


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  final _formKey = GlobalKey<FormState>();

  FirebaseServices _services = FirebaseServices();
  var _usernameTextController = TextEditingController();
  var _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0xFF82B1FF).withOpacity(.99),
        animationDuration: Duration(milliseconds: 500));

    _login({username, password})async{
      progressDialog.show();
      _services.getAdminCredentials(username).then((value) async {
        if (value.exists) {
          if (value.data()['username'] == username) {
            if (value.data()['password'] == password) {
              try {
                UserCredential userCredential = await FirebaseAuth.instance
                    .signInAnonymously();
                if (userCredential != null) {
                  progressDialog.dismiss();
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                }
              } catch (e) {
                progressDialog.dismiss();
                _services.showMyDialog(
                  context: context,
                    title: 'Login',
                    message: '${e.toString()}'
                );
              }
              return;
            }
            progressDialog.dismiss();
            _services.showMyDialog(
              context: context,
                title: 'Incorrect Password',
                message: 'Password you have entered is Invalid. Try again'
            );
            return;
          }
          progressDialog.dismiss();
          _services.showMyDialog(
            context: context,
              title: 'Invalid Username',
              message: 'Username you have entered is Incorrect. Try Again'
          );
        }
        progressDialog.dismiss();
        _services.showMyDialog(
          context: context,
            title: 'Invalid Username',
            message: 'Username you have entered is Incorrect. Try Again'
        );
      });
    }


    return Scaffold(

      body: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Center(child: Text('Connection Failed'),);
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF82B1FF),
                        Colors.white
                      ],
                      stops: [1.0, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 0.0)
                  )
              ),
              child: Center(
                child: Container(
                  width: 300,
                  height: 400,
                  child: Card(
                      elevation: 6,
                      shape: Border.all(
                          color: Colors.lightBlueAccent, width: 2),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Image.asset('images/logo.png'),
                                        Text('APP ADMIN', style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),),
                                        SizedBox(height: 20,),
                                        TextFormField(
                                          controller: _usernameTextController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Username';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'UserName',
                                            prefixIcon: Icon(Icons.person),

                                            contentPadding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme
                                                      .of(context)
                                                      .primaryColor,
                                                  width: 2
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        TextFormField(
                                          controller: _passwordTextController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Enter Password';
                                              }
                                              if (value.length < 6) {
                                                return 'Minimum 6 Character';
                                              }
                                              return null;
                                            },
                                            obscureText: false,
                                            decoration: InputDecoration(
                                                labelText: 'Minimum 6 Characters',
                                                prefixIcon: Icon(
                                                    Icons.vpn_key_sharp),
                                                hintText: 'Password',
                                                contentPadding: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                border: OutlineInputBorder(),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Theme
                                                            .of(context)
                                                            .primaryColor,
                                                        width: 2
                                                    )
                                                )
                                            )


                                        ),
                                      ],
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: FlatButton(
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                             _login(
                                               username: _usernameTextController.text,
                                               password: _passwordTextController.text
                                             );
                                            }
                                          },
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                          child: Text('Login', style: TextStyle(
                                              color: Colors.white),),
                                        ),
                                      ),
                                    ],
                                  )
                                ]
                            )
                        ),
                      )
                  ),
                ),
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}