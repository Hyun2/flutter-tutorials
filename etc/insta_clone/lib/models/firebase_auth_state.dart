import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:insta_clone/utils/simple_snackbar.dart';

class FirebaseAuthState extends ChangeNotifier {
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.progress;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _user;
  FacebookLogin _facebookLogin;

  void watchAuthChange() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null && _user == null) {
        changeFirebaseAuthStatus();
        return;
      } else if (user != _user) {
        _user = user;
        changeFirebaseAuthStatus();
      }
    });
  }

  void register(BuildContext context,
      {@required String email, @required String password}) {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      String _msg;
      switch (error.code) {
        case 'email-already-in-use':
          _msg = '이메일이 이미 사용 중입니다.';
          break;
        case 'invalid-email':
          _msg = '이메일이 형식이 잘못되었습니다.';
          break;
        case 'operation-not-allowed':
          _msg = '오류가 발생하였습니다.';
          break;
        case 'weak-password':
          _msg = '패스워드가 취약합니다.';
          break;
      }
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(_msg)));
    });
  }

  void signIn(BuildContext context,
      {@required String email, @required String password}) {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      String _msg;
      switch (error.code) {
        case 'invalid-email':
          _msg = '유효한 이메일이 아닙니다.';
          break;
        case 'user-disabled':
          _msg = '로그인할 수 없는 사용자입니다.';
          break;
        case 'user-not-found':
          _msg = '사용자를 찾을 수 없습니다.';
          break;
        case 'wrong-password':
          _msg = '비밀번호가 잘못되었습니다.';
          break;
      }

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(_msg)));
    });
  }

  void signInWithFacebook(BuildContext context) async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);

    if (_facebookLogin == null) _facebookLogin = FacebookLogin();
    final result = await _facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        _handleFacebookTokenWithFirebase(context, result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        simpleSnackbar(context, '페이스북 로그인을 취소하였습니다.');
        break;
      case FacebookLoginStatus.error:
        simpleSnackbar(context, '페이스북 로그인 중에 에러가 발생하였습니다.');
        _facebookLogin.logOut();
        break;
    }
  }

  void _handleFacebookTokenWithFirebase(
      BuildContext context, String token) async {
    final AuthCredential credential = FacebookAuthProvider.getCredential(token);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = userCredential.user;

    if (user == null) {
      simpleSnackbar(context, '페이스북 로그인 중에 에러가 발생하였습니다.');
    } else {
      _user = user;
    }
    notifyListeners();
  }

  void signOut() async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);
    _firebaseAuthStatus = FirebaseAuthStatus.signout;
    if (_user != null) {
      _user = null;
      await _firebaseAuth.signOut();

      if (await _facebookLogin.isLoggedIn) {
        _facebookLogin.logOut();
      }
    }
    notifyListeners();
  }

  void changeFirebaseAuthStatus([FirebaseAuthStatus firebaseAuthStatus]) {
    if (firebaseAuthStatus != null) {
      _firebaseAuthStatus = firebaseAuthStatus;
    } else {
      if (_user != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }

    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}

enum FirebaseAuthStatus { signout, progress, signin }
