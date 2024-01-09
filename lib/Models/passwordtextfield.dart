import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  PasswordTextField({
    required this.text,
    required this.controller,
    this.validator,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: Color.fromARGB(255, 58, 51, 51),
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Color.fromARGB(179, 29, 28, 28),
        ),
        labelText: widget.text,
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
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Color.fromARGB(179, 29, 28, 28),
            ),
          ),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        setState(() {
          // Notify the parent widget of changes
          widget.validator?.call(value);
        });
      },
    );
  }
}

Container CustomButton(
    BuildContext context, String text, bool isLogin, Function onTap) {
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
          text,
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
              return Color(0xFF63CA3F);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isObscure = true; // Initially, the text is obscured (for a password field)

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          reuseableTextField5('Password', Icons.lock, true, _controller),
        ],
      ),
    );
  }

  TextField reuseableTextField5(
      String text,
      IconData icon,
      bool isPasswordType,
      TextEditingController controller,
      ) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      enableSuggestions: !isObscure,
      autocorrect: !isObscure,
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
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon: isPasswordType
            ? GestureDetector(
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          child: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: Color.fromARGB(179, 29, 28, 28),
          ),
        )
            : null,
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }

  Widget reuseableTextField6(
      String text,
      IconData icon,
      bool isPasswordType,
      TextEditingController controller,
      ) {
    bool _obscureText = isPasswordType;

    void togglePasswordVisibility() {
      _obscureText = !_obscureText;
      // Call setState to update the UI after changing the visibility
      // This requires the context of a StatefulWidget
      // For example, this function should be inside a State class
      setState(() {});
    }

    return TextField(
      controller: controller,
      obscureText: _obscureText,
      enableSuggestions: !_obscureText,
      autocorrect: !_obscureText,
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
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: togglePasswordVisibility,
        ),
      ),
      keyboardType: _obscureText
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
