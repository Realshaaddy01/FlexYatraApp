import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/resuseable_widget.dart';
import '../utils/colo_extension.dart';
import 'profile_view.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String selectedHeight = 'Select Height';
  String selectedWeight = 'Select Weight';
  String selectedGender = 'Select Gender';
  String selectedComplication = 'Select Complication';
  TextEditingController _firstnameTextController = TextEditingController();
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController _contactnoTextController = TextEditingController();
  TextEditingController _dateofbirthTextController = TextEditingController();

  List<String> heightOptions = [
    'Select Height',
    '4\'0"',
    '4\'1"',
    '4\'2"',
    '4\'3"',
    '4\'4"',
    '4\'5"',
    '4\'6"',
    '4\'7"',
    '4\'8"',
    '4\'9"',
    '4\'10"',
    '4\'11"',
    '5\'0"',
    '5\'1"',
    '5\'2"',
    '5\'3"',
    '5\'4"',
    '5\'5"',
    '5\'6"',
    '5\'7"',
    '5\'8"',
    '5\'9"',
    '5\'10"',
    '5\'11"',
    '6\'0"',
    '6\'1"',
    '6\'2"',
    '6\'3"',
    '6\'4"',
    '6\'5"',
    '6\'6"',
  ];

  List<String> weightOptions = [
    'Select Weight',
    '40 kg',
    '45 kg',
    '50 kg',
    '55 kg',
    '60 kg',
    '65 kg',
    '70 kg',
    '75 kg',
    '80 kg',
    '85 kg',
    '90 kg',
    '95 kg',
    '100 kg',
    '105 kg',
    '110 kg',
    '115 kg',
    '120 kg',
    '125 kg',
    '130 kg',
    '135 kg',
    '140 kg',
    '145 kg',
    '150 kg',
  ];

  List<String> genderOptions = [
    'Select Gender',
    'Male',
    'Female',
    'Other',
  ];

  List<String> complicationOptions = [
    'Select Complication',
    'Heart Disease',
    'High Blood Pressure',
    'Diabetes',
    'Asthma',
    'Joint Pain',
    'Back Pain',
    'None',
  ];

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

    return null;
  }

  Future<void> _showAlertDialog(String title, String content) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveUserDataToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;

    final String firstName = _firstnameTextController.text;
    final String lastName = _lastnameTextController.text;
    final String password = _passwordTextController.text;
    final String email = _emailTextController.text;
    final String address = _addressTextController.text;
    final String contactNo = _contactnoTextController.text;
    final String dateOfBirth = _dateofbirthTextController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        contactNo.isEmpty ||
        dateOfBirth.isEmpty ||
        selectedComplication.isEmpty ||
        selectedHeight.isEmpty ||
        selectedWeight.isEmpty ||
        selectedGender.isEmpty) {
      _showAlertDialog('Error', 'Please fill in all fields.');
      return;
    }

    final RegExp passwordRegex =
        RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      _showAlertDialog('Error',
          'Password must contain at least 8 characters, one number, and one special character.');
      return;
    }

    try {
      // Register user with Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the UID of the newly created user
      String userId = userCredential.user!.uid;

      await firestore.collection('users').doc(userId).set({
        'uid': userId,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
        'contactNo': contactNo,
        'dateOfBirth': dateOfBirth,
        'complicaiton': selectedComplication,
        'height': selectedHeight,
        'weight': selectedWeight,
        'gender': selectedGender
      });

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Registration Successful'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileView()),
                  );
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      _showAlertDialog('Error', 'Failed to register. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: TColor.primaryG),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: logoWidget2("assets/images/round.png"),
                      ),
                      decoration: ShapeDecoration(
                        shape: CircleBorder(side: BorderSide.none),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 25, right: 5),
                      child: Container(
                        width: 317,
                        height: 67,
                        child: Text(
                          'REGISTRATION',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            // height: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.042,
                            width: MediaQuery.of(context).size.width * 0.39,
                            child: reuseableTextField4(
                                "First Name", false, _firstnameTextController),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.042,
                            width: MediaQuery.of(context).size.width * 0.39,
                            child: reuseableTextField4(
                                "Last Name", false, _lastnameTextController),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.042,
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: reuseableTextField4(
                        "Password", true, _passwordTextController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.042,
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: reuseableTextField4(
                        "Email", false, _emailTextController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.042,
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: reuseableTextField4(
                        "Address", false, _addressTextController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.042,
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: reuseableTextField4(
                        "Contact No.", false, _contactnoTextController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.042,
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: reuseableTextField4(
                        "Date Of Birth", false, _dateofbirthTextController),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomDropdown(
                  name: 'Complication',
                  value: selectedComplication,
                  options: complicationOptions,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedComplication = newValue;
                      });
                    }
                  },
                ),
                CustomDropdown(
                  name: 'Height',
                  value: selectedHeight,
                  options: heightOptions,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedHeight = newValue;
                      });
                    }
                  },
                ),
              ],
            ),
            CustomDropdown(
              name: 'Weight',
              value: selectedWeight,
              options: weightOptions,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedWeight = newValue;
                  });
                }
              },
            ),
            CustomDropdown(
              name: 'Gender',
              value: selectedGender,
              options: genderOptions,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedGender = newValue;
                  });
                }
              },
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 219, 219),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 11,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 219, 219),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFD42E2E),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 11,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 219, 219),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          SignUpButton(context, true, () {
                            _saveUserDataToFirestore()
                                .onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
