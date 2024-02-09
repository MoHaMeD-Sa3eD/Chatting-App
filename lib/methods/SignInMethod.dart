import 'package:firebase_auth/firebase_auth.dart';

Future<void> SignInMethod(
    {required String email, required String password}) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}
