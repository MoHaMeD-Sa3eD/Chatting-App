import 'package:chat_app/screens/ChatScreen.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:chat_app/screens/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Future.delayed(Duration(seconds: 1));
  FlutterNativeSplash.remove();

  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.iD: (context) => LoginScreen(),
        RegisterScreen.iD: (context) => RegisterScreen(),
        ChatScreen.iD: (context) => ChatScreen(),
      },
      initialRoute: LoginScreen.iD,
    );
  }
}
