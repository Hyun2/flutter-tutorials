import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/sign_form_switcher.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedForm = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SignFormSwitcher(selectedForm: selectedForm),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 45,
              child: _switchFormBtn(),
            )
          ],
        ),
      ),
    );
  }

  DecoratedBox _switchFormBtn() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (selectedForm == 0) {
              selectedForm = 1;
            } else {
              selectedForm = 0;
            }
          });
        },
        child: RichText(
          text: TextSpan(
            text: selectedForm == 0
                ? 'Already have an account?  '
                : "Don't have an account?  ",
            style: TextStyle(color: Colors.grey, fontSize: 16),
            children: [
              TextSpan(
                text: selectedForm == 0 ? 'Sign In' : 'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
