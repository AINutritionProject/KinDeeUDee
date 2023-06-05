import 'package:flutter/material.dart';
import 'package:appfood2/pages/register_success.dart';
import 'package:appfood2/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: const SingleChildScrollView(
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Future<void> _onRegistry() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await Auth().createUserWithEmailAndPassword(
      _usernameController.text,
      _passwordController.text,
      _phoneNumberController.text,
      _emailController.text,
    );
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterSuccesPage(),
      ),
    );
  }

  bool? isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  child: Text(
                    "ลงทะเบียน",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ))),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  child: Text(
                    "กรุณากรอกข้อมูลให้ครบถ้วน",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(35, 126, 132, 1)),
                  ))),
          Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
              height: 620,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(174, 254, 196, 0.65),
                  borderRadius: BorderRadius.circular(40)),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
                  child: TextFormSlot(
                    controller: _emailController,
                    name: "อีเมล",
                    validator: _emailValidator,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormSlot(
                      controller: _phoneNumberController,
                      name: "หมายเลขโทรศัพท์",
                      validator: _phoneValidator,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 30),
                    child: TextFormSlot(
                      controller: _usernameController,
                      name: "ชื่อผู้ใช้",
                      validator: _usernameValidator,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TextFormSlot(
                      controller: _passwordController,
                      name: "รหัสผ่าน",
                      validator: _passwordValidator,
                    )),
                Row(
                  children: [
                    Checkbox(
                        value: isAccept,
                        activeColor: Colors.blue,
                        onChanged: (newValue) {
                          setState(() {
                            isAccept = newValue;
                          });
                        }),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SizedBox(height: 400);
                            });
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: const Text(
                            "ฉันยอมรับข้อตกลงและเงื่อนไข นโยบายความเป็นส่วนตัว",
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          )),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: FaIcon(
                          FontAwesomeIcons.circleQuestion,
                          color: Colors.blue,
                          size: 13,
                        )),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 84),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(9, 183, 168, 1),
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize:
                            const Size(double.infinity, 54), //////// HERE
                      ),
                      onPressed: () {
                        _onRegistry();
                      },
                      child: const Text(
                        'ลงทะเบียน',
                        style: TextStyle(fontSize: 30),
                      ),
                    ))
              ])),
        ],
      ),
    );
  }
}

class TextFormSlot extends StatelessWidget {
  const TextFormSlot(
      {super.key,
      required this.controller,
      required this.name,
      required this.validator});
  final TextEditingController controller;
  final String name;
  final String? Function(String? val) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )),
        TextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(fontSize: 23),
          decoration: const InputDecoration(
            errorStyle: TextStyle(fontSize: 18, color: Colors.red),
            errorMaxLines: 2,
          ),
          obscureText: name == "รหัสผ่าน" ? true : false,
        ),
      ],
    );
  }
}

String? _emailValidator(String? val) {
  return null;
}

String? _phoneValidator(String? val) {
  return null;
}

String? _usernameValidator(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกชื่อผู้ใช้ของท่าน";
    } else if (text.contains(" ")) {
      return "ชื่อผู้ใช้ต้องไม่มีช่องว่าง";
    } else if (text.contains(RegExp('[^A-Za-z\u0E00-\u0E7F_0-9]'))) {
      return "ชื่อผู้ใช้ต้องไม่มีตัวอักษรพิเศษอื่นนอกจาก \"_\"";
    } else if (!text.contains(RegExp('^[A-Za-z\u0E00-\u0E7F]'))) {
      return "ชื่อผู้ใช้ต้องขึ้นต้นด้วยตัวอักษรธรรมดาเท่านั้น";
    } else if (text.length < 5 || text.length > 15) {
      return "ืชื่อผู้ใช้ต้องมีความยาวอย่างน้อย 5 ตัวอักษร แต่ไม่เกิน 15 ตัวอักษร";
    }
  }
  return null;
}

String? _passwordValidator(String? val) {
  return null;
}
