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
                        EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    hintText: 'Email',
                    focusedBorder: UnderlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[100],
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
                    fillColor: Colors.grey[100],
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
                    fillColor: Colors.grey[100],
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
                _joinBtn(context),
                SizedBox(height: common_gap),
                _orDivider(),
                FlatButton.icon(
                    textColor: Colors.blue[900],
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage('assets/images/facebook.png'),
                    ),
                    label: Text('Login with Facebook',
                        style: TextStyle(fontSize: 17))),
              ],
            )),
      ),
    );
  }

  FlatButton _joinBtn(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print('validated');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        }
      },
      child: Text(
        'Join',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          // height: 1,
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
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
