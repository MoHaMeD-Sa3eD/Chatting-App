import 'package:chat_app/constants/appConstants.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomWidgets/CustomElevatedButton.dart';
import '../CustomWidgets/CustomWidgets/CustomTextField.dart';
import '../CustomWidgets/CustomWidgets/CustomTextWidget.dart';
import '../CustomWidgets/CustomWidgetsModels/CustomTextFieldModel.dart';
import '../methods/RegisterMethod.dart';
import '../methods/ScaffoldMessangerSnackBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'ChatScreen.dart';

class RegisterScreen extends StatefulWidget {
  static String iD = 'RegisterScreen';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/scholar.png'),
                    const Text(
                      'Scholar Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Pacifico'),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'REGISTER',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      customTextFieldModel: CustomTextFieldModel(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        onChanged: (data) {
                          email = data;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty ||
                              !value.toString().contains('@') ||
                              !value.toString().contains('.com')) {
                            return 'Enter a valid email';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      customTextFieldModel: CustomTextFieldModel(
                        obscureText: true,
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          onChanged: (data) {
                            password = data;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Wrong email or password';
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(
                      name: 'REGISTER',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await RegisterMethod(
                                email: email!, password: password!);
                            SnackBarMessage(context, message: 'Success!');
                            Navigator.pushReplacementNamed(
                                context, ChatScreen.iD);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              SnackBarMessage(context,
                                  message: 'weak-password');
                            } else if (e.code == 'email-already-in-use') {
                              SnackBarMessage(context,
                                  message: 'email-already-in-use');
                            }
                          } catch (e) {
                            print(e);
                            SnackBarMessage(context,
                                message:
                                    'there was an error , check your inputs! ');
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have account?  ',
                          style: TextStyle(color: Colors.white),
                        ),
                        CustomTextButton(
                          name: 'LOGIN',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.iD);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
