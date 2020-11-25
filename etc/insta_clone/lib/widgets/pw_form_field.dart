import 'package:flutter/material.dart';

class PwFormField extends StatelessWidget {
  final passwordController;

  const PwFormField(this.passwordController, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black54,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
    );
  }
}
