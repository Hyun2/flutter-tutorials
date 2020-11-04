import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/constants/common_size.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _pwTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          child: ListView(
            children: [
              Image.asset('assets/images/insta_text_logo.png'),
              TextFormField(
                controller: _emailTextController,
              ),
              TextFormField(
                controller: _pwTextController,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text('Join'),
              ),
              SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1,
                    color: Colors.grey[300],
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
                // icon: Image.asset('assets/images/facebook.png'),
                icon: ImageIcon(
                  AssetImage('assets/images/facebook.png'),
                ),
                label: Text(
                  'Login with Facebook',
                ),
              ),
              // FlatButton(),
            ],
          ),
        ),
      ),
    );
  }
}
