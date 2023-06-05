import 'package:appfood2/auth.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/pages/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/widgets/button_back.dart';
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

  Future<void> _onLogin() async {
    if (_formKey.currentState!.validate()) {
      await Auth().signInWithUsername(
          _usernameController.text, _passwordController.text);
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
                "ชื่อผู้ใช้",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 24, top: 20, bottom: 60),
                child: TextFormField(
                  controller: _usernameController,
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
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
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        // this button is used to toggle the password visibility
                        suffixIcon: IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility
                                // ignore: dead_code
                                : Icons.visibility_off),
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
            const Center(
              child: Text(
                "ลืมรหัสผ่าน?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
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
            )
          ],
        ));
  }
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // function to random color

  // random backgroundColor every 0.2 second when start Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
        body: SafeArea(
          child: SingleChildScrollView(
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
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 20, bottom: 22),
                child: Container(
                  width: double.infinity,
                  height: 540,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(254, 246, 174, 1),
                      borderRadius: BorderRadius.all(Radius.circular(45))),
                  child: const LogInForm(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.line,
                        color: Colors.green,
                        size: 35,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.squareFacebook,
                        color: Colors.blue,
                        size: 37,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.deepOrangeAccent,
                        size: 37,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Auth().signInWithGoogle(_googleSignIn);
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.deepOrange,
                          size: 34,
                        ),
                      ),
                      const FaIcon(
                        FontAwesomeIcons.envelope,
                        color: Colors.indigo,
                        size: 37,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
