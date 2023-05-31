// ignore_for_file: use_build_context_synchronously
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';
import '../../models/user/user_model.dart';
import '../../routes/routes_name.dart';
import '../../view/screens/splash/splash_screen.dart';
import '../../view/widgets/snack_bar/my_snack_bar.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  addUser(String uid, UserModel user) async {
    final userCollection =
        FirebaseFirestore.instance.collection("users").doc(uid);

    await userCollection.set(user.toJson());
  }

  Future<void> signUpWithEmail(
      {required BuildContext context,
      required String username,
      required String email,
      required String password}) async {
    setLoading(true);

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      setLoading(false);
      addUser(
          _auth.currentUser!.uid, UserModel(username: username, email: email));
      await sentEmailVerification(context);
      if (_auth.currentUser!.emailVerified) {
        Navigator.pushNamed(context, RoutesName.login);
      }
      Navigator.pushReplacementNamed(context, RoutesName.login);
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      MySnackBar(context, e.message!);
    }
  }

  Future<void> sentEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      MySnackBar(context, "Email verification sent!");
    } on FirebaseAuthException catch (e) {
      MySnackBar(context, e.message!);
    }
  }

  Future<void> signInWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (!_auth.currentUser!.emailVerified) {
        setLoading(false);
        MySnackBar(context, "Your email is not verified!");
        await sentEmailVerification(context);
      } else {
        MySnackBar(context, "Login successfully!");
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.splash);
      }
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      MySnackBar(context, e.message!);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            UserModel user = UserModel(
                uid: userCredential.user!.uid,
                fullName: userCredential.user!.displayName ?? '',
                email: userCredential.user!.email ?? '');

            await addUser(userCredential.user!.uid, user);

            setLoading(false);
            Navigator.pushNamed(context, RoutesName.splash);
          } else {
            setLoading(false);
            Navigator.pushNamed(context, RoutesName.home);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      MySnackBar(context, e.message.toString());
    }
  }

  Future signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);

      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          UserModel user = UserModel(
              uid: userCredential.user!.uid,
              fullName: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '');

          await addUser(userCredential.user!.uid, user);

          setLoading(false);
          Navigator.pushNamed(context, RoutesName.splash);
        } else {
          setLoading(false);
          Navigator.pushNamed(context, RoutesName.home);
        }
      }
    } on FirebaseAuthException catch (e) {
      MySnackBar(context, e.message.toString());
    }
  }

  Future signInWithTwitter(BuildContext context) async {
    final twitterLogin = TwitterLogin(
        apiKey: 'agdrngJStQ8bmjkJnvZmKd6CU',
        apiSecretKey: 'NYPcfWMERUGJWcJtVOGhWF9i1OYt900lsDCcTfIII0aeP0nQeN',
        redirectURI: 'GuideWay://');

    final authResult = await twitterLogin.login();

    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    try {
       UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

    if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          UserModel user = UserModel(
              uid: userCredential.user!.uid,
              fullName: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '');
          await addUser(userCredential.user!.uid, user);
          setLoading(false);
          Navigator.pushNamed(context, RoutesName.splash);
        } else {
          setLoading(false);
          Navigator.pushNamed(context, RoutesName.home);
        }
      }
    } on FirebaseAuthException catch (e) {
      MySnackBar(context, e.message.toString());
    }
  }

  Future changePassword(
      BuildContext context, String password, String newPassword) async {
    setLoading(true);

    final user = _auth.currentUser!;
    final credential =
        EmailAuthProvider.credential(email: user.email!, password: password);

    await user.reauthenticateWithCredential(credential).then((value) async {
      await user.updatePassword(newPassword).then((value) {
        setLoading(false);
        MySnackBar(context, "Password Updated!");
      }).onError((error, stackTrace) {
        setLoading(false);
        MySnackBar(context, error.toString());
      });
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  Future resetPassword(String email, BuildContext context) async {
    setLoading(true);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CircularProgressIndicator());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setLoading(false);
      MySnackBar(context, "Password Reset Link sent!");
      Navigator.of(context).popUntil(((route) => route.isFirst));
      await Navigator.pushReplacementNamed(context, RoutesName.login);
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      MySnackBar(context, e.message!);
    }
  }

  Future signOut(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const SplashScreen());
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      MySnackBar(context, e.message!);
    }
  }
}
