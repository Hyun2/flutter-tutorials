import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/main.dart';
import 'package:insta_clone/models/firebase_auth_state.dart';
import 'package:insta_clone/widgets/email_form_field.dart';
import 'package:insta_clone/widgets/pw_form_field.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              // _emailFormField(),
              EmailFormField(_emailController),
              SizedBox(height: common_xxs_gap),
              // _pwFormField(),
              PwFormField(_passwordController),
              SizedBox(height: common_xxs_gap),
              _confirmPwFormField(),
              SizedBox(
                height: common_gap,
              ),
              _signUpBtn(context),
              SizedBox(height: common_gap),
              _orDivider(),
              TextButton.icon(
                onPressed: () {
                  print('validated');
                  Provider.of<FirebaseAuthState>(context, listen: false)
                      .signInWithFacebook(context);
                },
                style: TextButton.styleFrom(primary: Colors.blue[900]),
                icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                label: Text('Login with Facebook'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _confirmPwFormField() {
    return TextFormField(
      cursorColor: Colors.black54,
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        hintText: 'Confirm Password',
        focusedBorder: UnderlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300])),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value.isNotEmpty && _passwordController.text == value) {
          return null;
        } else {
          return '패스워드가 일치하지 않습니다.';
        }
      },
    );
  }

  // TextFormField _pwFormField() {
  //   return TextFormField(
  //     cursorColor: Colors.black54,
  //     controller: _passwordController,
  //     obscureText: true,
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
  //       hintText: 'Password',
  //       focusedBorder: UnderlineInputBorder(),
  //       enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: BorderSide(color: Colors.grey[300])),
  //       filled: true,
  //       fillColor: Colors.grey[200],
  //     ),
  //     validator: (value) {
  //       if (value.isNotEmpty) {
  //         return null;
  //       } else {
  //         return '패스워드를 입력해주세요.';
  //       }
  //     },
  //   );
  // }

  TextButton _signUpBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print('validated');
          Provider.of<FirebaseAuthState>(context, listen: false).register(
              context,
              email: _emailController.text,
              password: _passwordController.text);
        }
      },
      child: Text('Sign Up'),
      style: TextButton.styleFrom(backgroundColor: Colors.blue),
    );
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 1,
          color: Colors.grey,
        ),
        Container(
          width: 60,
          height: 3,
          color: Colors.white,
        ),
        Text(
          'OR',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[500]),
        ),
      ],
    );
  }
}
