import 'package:flutter/material.dart';
import 'package:insta_clone/models/firebase_auth_state.dart';
import 'package:insta_clone/screens/auth_screen.dart';
import 'package:provider/provider.dart';

class ProfileSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(title: Text('Settings')),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap: () {
              Provider.of<FirebaseAuthState>(context, listen: false).signOut();
            },
          ),
        ],
      ),
    );
  }
}
