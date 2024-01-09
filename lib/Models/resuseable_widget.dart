import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    // color: Colors.white,
  );
}

Image logoWidget2(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 86,
    height: 86,
    // color: Colors.white,
  );
}

Image logoWidget3(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 279,
    height: 206,
    // color: Colors.white,
  );
}

Image logoWidget4(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 135,
    height: 133,
  );
}

// TextField reuseableTextField5(
//     String text,
//     IconData icon,
//     bool isPasswordType,
//     TextEditingController controller,
//     ) {
//   bool isObscure = isPasswordType;
//
//   return TextField(
//     controller: controller,
//     obscureText: isObscure,
//     enableSuggestions: !isObscure,
//     autocorrect: !isObscure,
//     cursorColor: Color.fromARGB(255, 58, 51, 51),
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         icon,
//         color: Color.fromARGB(179, 29, 28, 28),
//       ),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: const Color(0xFFD9D9D9),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30.0),
//         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//       ),
//       suffixIcon: isPasswordType
//           ? GestureDetector(
//         onTap: () {
//           setState(() {
//             isObscure = !isObscure;
//           });
//         },
//         child: Icon(
//           isObscure ? Icons.visibility : Icons.visibility_off,
//           color: Color.fromARGB(179, 29, 28, 28),
//         ),
//       )
//           : null,
//     ),
//     keyboardType: isPasswordType
//         ? TextInputType.visiblePassword
//         : TextInputType.emailAddress,
//   );
// }






TextField reuseableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 58, 51, 51),
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(179, 29, 28, 28),
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color(0xFFD9D9D9),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField reuseableTextField2(
    String text, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 238, 217, 217),
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontSize: 16,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 247, 241, 241),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    scrollPadding: EdgeInsets.symmetric(vertical: 10.0),
  );
}

TextField reuseableTextField4(
    String text, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 238, 217, 217),
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 247, 241, 241),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0), // Adjust as needed
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    scrollPadding: EdgeInsets.symmetric(vertical: 10.0),
  );
}

// TextField reusableTextField3(String text, TextEditingController controller) {
//   bool obscureText = true; // Initially set to password mode

//   return TextField(
//     controller: controller,
//     obscureText: obscureText,
//     enableSuggestions: true,
//     autocorrect: true,
//     cursorColor: Color.fromARGB(255, 58, 51, 51),
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         Icons.lock,
//         color: Color.fromARGB(179, 29, 28, 28),
//       ),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: const Color(0xFFD9D9D9),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30.0),
//         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//       ),
//       suffixIcon: GestureDetector(
//         onTap: () {
//           //  setState(() {
//               obscureText = !obscureText;
//             // });
//           },
//         child: Padding(
//           padding: EdgeInsets.only(right: 10.0),
//           child: Icon(
//             obscureText ? Icons.visibility : Icons.visibility_off,
//             color: Color.fromARGB(179, 29, 28, 28),
//           ),
//         ),
//       ),
//     ),
//     keyboardType: TextInputType.visiblePassword,
//   );
// }

TextField reusableTextField3(String text, TextEditingController controller) {
  bool obscureText = true; // Initially set to password mode

  return TextField(
    controller: controller,
    obscureText: obscureText,
    enableSuggestions: true,
    autocorrect: true,
    cursorColor: Color.fromARGB(255, 58, 51, 51),
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.lock,
        color: Color.fromARGB(179, 29, 28, 28),
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color(0xFFD9D9D9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          // Toggle password visibility
          // setState(() {
          obscureText = !obscureText;
          // });
        },
        child: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            // ignore: dead_code
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Color.fromARGB(179, 29, 28, 28),
          ),
        ),
      ),
    ),
    keyboardType: TextInputType.visiblePassword,
  );
}

Container SignInButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: MediaQuery.of(context).size.height * 0.06,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          'LOG IN',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size.fromHeight(45.0)),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Color(0xFF00E09E);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container SignUpButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: MediaQuery.of(context).size.height * 0.06,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'SIGN UP',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size.fromHeight(45.0)),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return const Color(0xFFD42E2E);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

// class CustomDropdown extends StatelessWidget {
//   final String name;
//   final String? value; // Change to nullable String
//   final List<String> options;
//   final void Function(String?) onChanged; // Change to nullable String

//   CustomDropdown({
//     required this.name,
//     required this.value,
//     required this.options,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 3, top: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.040,
//             width: MediaQuery.of(context).size.width * 0.82,
//             child: DropdownButton<String>(
//               value: value,
//               onChanged: onChanged,
//               items: options.map<DropdownMenuItem<String>>((String option) {
//                 return DropdownMenuItem<String>(
//                   value: option,
//                   child: Text(option),
//                   enabled: option != 'Select $name',
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CustomDropdown extends StatelessWidget {
  final String name;
  final String? value;
  final List<String> options;
  final void Function(String?) onChanged;

  CustomDropdown({
    required this.name,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.047,
            width: MediaQuery.of(context).size.width * 0.82,
            child: DropdownButtonFormField<String>(
              value: value,
              onChanged: onChanged,
              style: TextStyle(fontSize: 14, color: Colors.black, ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 247, 241, 241),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                isDense: true,
              ),
              hint: Text('Select $name'), // Default option
              items: options.map<DropdownMenuItem<String>>((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Center(child: Text(option)),
                  enabled: option != 'Select $name',
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}






// Container CustomButton(BuildContext context, String text, bool isLogin, Function onTap) {
//   return Container(
//     width: MediaQuery.of(context).size.width * 0.45,
//     height: MediaQuery.of(context).size.height * 0.06,
//     margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(90),
//     ),
//     child: ElevatedButton(
//       onPressed: () {
//         onTap();
//       },
//       child: Center(
//         child: Text(
//           text,  
//           style: TextStyle(
//             color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
//             fontSize: 18,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w500,
//             height: 0,
//           ),
//         ),
//       ),
//       style: ButtonStyle(
//           fixedSize: MaterialStateProperty.all(Size.fromHeight(45.0)),
//           backgroundColor: MaterialStateProperty.resolveWith(
//             (states) {
//               if (states.contains(MaterialState.pressed)) {
//                 return Colors.black26;
//               }
//               return Color(0xFF63CA3F);
//             },
//           ),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
//     ),
//   );
// }
