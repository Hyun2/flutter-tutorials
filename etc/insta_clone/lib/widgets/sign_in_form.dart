import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/models/firebase_auth_state.dart';
import 'package:insta_clone/widgets/email_form_field.dart';
import 'package:insta_clone/widgets/pw_form_field.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _pwTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              EmailFormField(_emailTextController),
              SizedBox(height: common_xxs_gap),
              PwFormField(_pwTextController),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgotten Password?',
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: common_gap),
              _signInBtn(context),
              SizedBox(height: common_gap),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 3,
                    color: Colors.white,
                  ),
                  Text('OR', style: TextStyle(color: Colors.grey[500]))
                ],
              ),
              TextButton.icon(
                style: TextButton.styleFrom(primary: Colors.blue[900]),
                onPressed: () {
                  print('validated');
                  Provider.of<FirebaseAuthState>(context, listen: false)
                      .signInWithFacebook(context);
                },
                // icon: Image.asset('assets/images/facebook.png'), // 불가
                icon: ImageIcon(
                  AssetImage('assets/images/facebook.png'),
                ),
                label: Text('Login with Facebook'),
              ),
              // FlatButton(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _signInBtn(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print('validated');
          Provider.of<FirebaseAuthState>(context, listen: false).signIn(context,
              email: _emailTextController.text,
              password: _pwTextController.text);
        }
      },
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
