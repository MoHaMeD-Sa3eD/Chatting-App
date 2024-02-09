import 'package:firebase_auth/firebase_auth.dart';

Future<void> RegisterMethod(
    {required String email, required String password}) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!);
}
