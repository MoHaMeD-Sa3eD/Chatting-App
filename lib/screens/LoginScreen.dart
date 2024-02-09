import 'package:chat_app/constants/appConstants.dart';
import 'package:chat_app/methods/ScaffoldMessangerSnackBar.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../CustomWidgets/CustomWidgets/CustomElevatedButton.dart';
import '../CustomWidgets/CustomWidgets/CustomTextField.dart';
import '../CustomWidgets/CustomWidgets/CustomTextWidget.dart';
import '../CustomWidgets/CustomWidgetsModels/CustomTextFieldModel.dart';
import '../methods/SignInMethod.dart';
import 'ChatScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  static String iD = 'LoginScreen';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        'LOGIN',
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
                          }),
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
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(
                        name: 'Sign in',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await SignInMethod(
                                  email: email!, password: password!);

                              Navigator.pushReplacementNamed(
                                context,
                                ChatScreen.iD,
                                arguments: email,
                              );
                            } catch (e) {
                              SnackBarMessage(context,
                                  message:
                                      'Error, check your inputs or your internet and try again');
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'don\'t have account?  ',
                          style: TextStyle(color: Colors.white),
                        ),
                        CustomTextButton(
                          name: 'Register',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.iD);
                          },
                        )
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
