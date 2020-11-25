import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final emailController;

  const EmailFormField(this.emailController, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black54,
      controller: emailController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
    );
  }
}
