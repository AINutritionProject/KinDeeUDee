import 'package:appfood2/auth.dart';
import 'package:appfood2/widgets/error_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/pages/register.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/widgets/button_back.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/pages/change_password.dart';
import 'dart:async';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LogInFormState extends State<LogInForm> {
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      Future<String?> result = Auth().signInWithUsername(
          _usernameController.text, _passwordController.text);
      result.then((errorCode) {
        if (errorCode != null) {
          var errorString = "พบปัญหาโปรดลองอีกครั้ง";
          if (errorCode == "No element") {
            errorString =
                "ไม่มีชื่อผู้ใช้หรืออีเมลนี้อยู่ในระบบ\nกรุณาสร้างบัญชีผู้ใช้";
          } else if (errorCode == "wrong-password") {
            errorString = "รหัสผ่านไม่ถูกต้อง";
          } else if (errorCode == "too-many-requests") {
            errorString =
                "กรอกรหัสผ่านไม่ถูกต้องหลายครั้ง\nโปรดลองอีกครั้งในภายหลัง";
          } else if (errorCode == "user-disabled") {
            errorString = "บัญชีนี้ถูกระงับการใช้งาน";
          }
          showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(errorString: errorString);
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 34),
              child: Text(
                "ชื่อผู้ใช้/อีเมล",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 24, top: 20, bottom: 60),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _usernameValidator,
                  controller: _usernameController,
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    errorStyle: TextStyle(fontSize: 18, color: Colors.red),
                    errorMaxLines: 2,
                  ),
                  style: const TextStyle(fontSize: 20),
                )),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                "รหัสผ่าน",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 24,
                  top: 20,
                ),
                child: TextFormField(
                    controller: _passwordController,
                    validator: _passwordValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        // this button is used to toggle the password visibility
                        errorStyle:
                            const TextStyle(fontSize: 18, color: Colors.red),
                        errorMaxLines: 2,
                        suffixIcon: IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility_off
                                // ignore: dead_code
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            })),
                    style: const TextStyle(fontSize: 20))),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 79, top: 28),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 120, 63, 1),
                    minimumSize: const Size.fromHeight(54),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    )),
                onPressed: () {
                  _onLogin();
                },
                child: const Text(
                  "ลงชื่อเข้าใช้",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RepassWord()));
                },
                child: const Text(
                  "ลืมรหัสผ่าน?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "หรือ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      " สร้างบัญชีผู้ใช้",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _onGoogleSignIn() {
    Future<String?> result = Auth().signInWithGoogle(_googleSignIn);
    result.then((errorCode) {
      if (errorCode != null) {
        var errorString = "พบปัญหาโปรดลองอีกครั้ง";
        if (errorCode == "account-exists-with-different-credential") {
          errorString = "อีเมลนี้มีอยู่แล้วในระบบ";
        } else if (errorCode == "user-disabled") {
          errorString = "บัญชีนี้ถูกระงับการใช้งาน";
        }
        showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(errorString: errorString);
          },
        );
      }
    });
  }

  // function to random color

  // random backgroundColor every 0.2 second when start Widget
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
        body: SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: screenSizeData.screenHeight,
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              width: screenSizeData.screenSizeWidth,
              color: const Color.fromRGBO(255, 251, 242, 1),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24, top: 20),
                      child: ButtonBack(
                        colorCircle: Color(0xFFFF783F),
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 38, left: 28),
                      child: Text(
                        "ลงชื่อเข้าใช้",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 20, bottom: 22),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(254, 246, 174, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        child: const LogInForm(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // const FaIcon(
                            //   FontAwesomeIcons.line,
                            //   color: Colors.green,
                            //   size: 35,
                            // ),
                            GestureDetector(
                              child: const FaIcon(
                                FontAwesomeIcons.squareFacebook,
                                color: Colors.blue,
                                size: 37,
                              ),
                              onTap: () async {
                                print("LOG");
                                try {
                                  final FacebookLogin facebookLogin =
                                      FacebookLogin();
                                  FacebookLoginResult result =
                                      await facebookLogin.logIn(permissions: [
                                    FacebookPermission.publicProfile,
                                    FacebookPermission.email
                                  ]);
                                  print("Result is");
                                  print(result);
                                  switch (result.status) {
                                    case FacebookLoginStatus.success:
                                      String? token = result.accessToken?.token;
                                      print("token: $token");
                                      if (token == null) {
                                        return;
                                      }
                                      final AuthCredential credential =
                                          FacebookAuthProvider.credential(
                                              token);
                                      await FirebaseAuth.instance
                                          .signInWithCredential(credential);
                                      print("Login facebook sucess");
                                      break;
                                    case FacebookLoginStatus.cancel:
                                      print("Login facebook got cancel!");
                                      break;
                                    case FacebookLoginStatus.error:
                                      print("error when login with facebook");
                                      break;
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                            // const FaIcon(
                            //   FontAwesomeIcons.instagram,
                            //   color: Colors.deepOrangeAccent,
                            //   size: 37,
                            // ),
                            GestureDetector(
                              onTap: () {
                                _onGoogleSignIn();
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.deepOrange,
                                size: 34,
                              ),
                            ),
                            // const FaIcon(
                            //   FontAwesomeIcons.envelope,
                            //   color: Colors.indigo,
                            //   size: 37,
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        );
      }),
    ));
  }
}

String? _usernameValidator(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกชื่อผู้ใช้หรืออีเมลของท่าน";
    }
  }
  return null;
}

String? _passwordValidator(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกรหัสผ่านของท่าน";
    }
  }
  return null;
}
