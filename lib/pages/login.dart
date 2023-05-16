import 'package:appfood2/auth.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/pages/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:math';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _onLogin() async {
    if (_formKey.currentState!.validate()) {
      await Auth().signInAnonymously();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "ชื่อผู้ใช้",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: _emailController,
              cursorHeight: 30,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "รหัสผ่าน",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent),
                onPressed: () {
                  _onLogin();
                },
                child: const Text(
                  "ลงชื่อเข้าใช้",
                  style: TextStyle(fontWeight: FontWeight.w200),
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
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                  },
                  child: const Text(
                    " สร้างบัญชีผู้ใช้",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.pinkAccent),
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
  Color _color = Colors.white;
  Color _color2 = Colors.black;
  late Timer _timer;

  // function to random color
  void _randomColor() {
    setState(() {
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _color2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  // random backgroundColor every 0.2 second when start Widget
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _randomColor();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "ลงชื่อเข้าใช้",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: _color2,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: const LogInForm(),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await Auth().signInWithGoogle(_googleSignIn);
                },
                child: const Text("Google"),
              )
            ],
          )
        ],
      ),
    );
  }
}
