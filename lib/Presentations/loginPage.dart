
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexyatra_app/Presentations/forgetpassword.dart';
import 'package:flexyatra_app/Presentations/registrationpage.dart';
import 'package:flutter/material.dart';
import '../Models/passwordtextfield.dart';
import '../Models/resuseable_widget.dart';
import '../utils/colo_extension.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (!value.contains(RegExp(r'\d'))) {
      return 'Password must contain at least one number';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null; // No validation error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: TColor.primaryG),
        ),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(360)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.05, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: logoWidget2("assets/images/round.png"),
                  ),
                  Container(
                    width: 361,
                    height: 60,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 49,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0.0, -30.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: logoWidget3("assets/images/avatar.png"),
                      ),
                    ],
                  ),
                  reuseableTextField("Enter Username / Email",
                      Icons.person_outline, false, _emailTextController),
                  SizedBox(
                    height: 15,
                  ),
                  // reuseableTextField("Enter Password", Icons.lock, false,
                  //     _passwordTextController),
                  PasswordTextField(
                    text: "Enter Password",
                    controller: _passwordTextController,
                    validator: _passwordValidator,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignInButton(context, true, () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          // Successful login, navigate to the profile view
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }).catchError((error) {
                          // Handle login failure and show a Snackbar with an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login failed: ${error.message}'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          print("Error ${error.toString()}");
                        });
                      }),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0.0, -30.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignUpButton(context, true, () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage()))
                            .onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetPassword()),
                          );
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        'Journey to Wellness',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width:
                                        5), // Empty space equivalent to left: 192
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: ShapeDecoration(
                                    color: Color.fromARGB(255, 151, 142, 142),
                                    shape: CircleBorder(),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        5), // Adjust the spacing between widgets
                                Container(
                                  width: 20,
                                  height: 10,
                                  decoration: ShapeDecoration(
                                    color: Color.fromARGB(255, 241, 17, 17),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        5), // Adjust the spacing between widgets
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: ShapeDecoration(
                                    color: Color.fromARGB(255, 151, 142, 142),
                                    shape: CircleBorder(),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        5), // Adjust the spacing between widgets
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: ShapeDecoration(
                                    color: Color.fromARGB(255, 151, 142, 142),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
