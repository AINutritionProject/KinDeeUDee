import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: const Center(
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
  bool? isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormSlot(controller: _emailController, name: "อีเมล"),
          TextFormSlot(
            controller: _phoneNumberController,
            name: "หมายเลขโทรศัพท์",
          ),
          TextFormSlot(
            controller: _usernameController,
            name: "ชื่อผู้ใช้",
          ),
          TextFormSlot(
            controller: _passwordController,
            name: "รหัสผ่าน",
          ),
          Row(
            children: [
              Checkbox(
                  value: isAccept,
                  onChanged: (newValue) {
                    setState(() {
                      isAccept = newValue;
                    });
                  }),
              const Text("ฉันยอมรับข้อตกลงและเงื่อนไข นโยบายความเป็นส่วนตัว"),
            ],
          )
        ],
      ),
    );
  }
}

class TextFormSlot extends StatelessWidget {
  const TextFormSlot({super.key, required this.controller, required this.name});
  final TextEditingController controller;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        TextFormField(controller: controller),
      ],
    );
  }
}
