import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/main.dart';

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
              TextFormField(
                controller: _emailTextController,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  focusedBorder: UnderlineInputBorder(),
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value.isNotEmpty && value.contains('@')) {
                    return null;
                  } else {
                    return '정확한 이메일을 입력해주세요.';
                  }
                },
              ),
              SizedBox(height: common_xxs_gap),
              TextFormField(
                controller: _pwTextController,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value.isNotEmpty) {
                    return null;
                  } else {
                    return '정확한 비밀번호를 입력해주세요,';
                  }
                },
              ),
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print('validated');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: Text('Join'),
              ),
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
                onPressed: () {},
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
}
