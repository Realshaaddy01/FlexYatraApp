import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../Models/passwordtextfield.dart';
import '../Models/resuseable_widget.dart';
import '../utils/colo_extension.dart';
import 'profile_view.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

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

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password cannot be empty';
    }

    if (value != _passwordTextController.text) {
      return 'Passwords do not match';
    }

    return null; // No validation error
  }

  Map<String, String?> validationErrors = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(360)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.03, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 30),
                    child: logoWidget2("assets/images/round.png"),
                  ),
                  Container(
                    width: 360,
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
                                'Forget Password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 38,
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
                        offset: const Offset(0.0, 10.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: logoWidget4("assets/images/forgot-password.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  PasswordTextField(
                    text: "New Password",
                    controller: _passwordTextController,
                    validator: _passwordValidator,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PasswordTextField(
                    text: "Confirm Password",
                    controller: _confirmPasswordTextController,
                    validator: _confirmPasswordValidator,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(context, 'Submit', true, () async {
                    // Validate input
                    if (_passwordValidator(_passwordTextController.text) !=
                            null ||
                        _confirmPasswordValidator(
                                _confirmPasswordTextController.text) !=
                            null) {
                      setState(() {
                        validationErrors = {
                          'password':
                              _passwordValidator(_passwordTextController.text),
                          'confirmPassword': _confirmPasswordValidator(
                              _confirmPasswordTextController.text),
                        };
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fix the validation errors.'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      validationErrors = {};
                    });

                    // Update data in Firestore
                    await usersCollection.doc('your_user_id').update({
                      'password': _passwordTextController.text,
                      'email': _emailTextController.text,
                    }).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  Transform.translate(
                    offset: Offset(0.0, -30.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color.fromARGB(255, 151, 142, 142),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color.fromARGB(255, 151, 142, 142),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color.fromARGB(255, 151, 142, 142),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 5),
                              child: Container(
                                width: 11,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: Color.fromARGB(255, 151, 142, 142),
                                  shape: OvalBorder(),
                                ),
                              ),
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
