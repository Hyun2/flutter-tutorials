import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/main.dart';

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
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    hintText: 'Email',
                    focusedBorder: UnderlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value.isNotEmpty && value.contains('@')) {
                      return null;
                    } else {
                      return '적절한 이메일을 입력해주세요.';
                    }
                  },
                ),
                SizedBox(height: common_xxs_gap),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    hintText: 'Password',
                    focusedBorder: UnderlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    } else {
                      return '패스워드를 입력해주세요.';
                    }
                  },
                ),
                SizedBox(height: common_xxs_gap),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
                ),
                SizedBox(
                  height: common_gap,
                ),
                _signUpBtn(context),
                SizedBox(height: common_gap),
                _orDivider(),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(primary: Colors.blue[900]),
                  icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                  label: Text('Login with Facebook'),
                ),
              ],
            )),
      ),
    );
  }

  TextButton _signUpBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
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
