import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/sign_in_form.dart';
import 'package:insta_clone/widgets/sign_up_form.dart';

class SignFormSwitcher extends StatefulWidget {
  final int selectedForm;

  const SignFormSwitcher({Key key, this.selectedForm}) : super(key: key);
  @override
  _SignFormSwitcherState createState() => _SignFormSwitcherState();
}

class _SignFormSwitcherState extends State<SignFormSwitcher>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [
    SignUpForm(),
    SignInForm(),
  ];

  AnimationController _formSwitchController;

  @override
  void initState() {
    _formSwitchController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _formSwitchController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _formSwitchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SignFormSwitcher oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm) {
      _formSwitchController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _formSwitchController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: forms,
      ),
    );
  }
}
