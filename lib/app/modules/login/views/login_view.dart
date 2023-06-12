import 'package:dataontest/app/data/services/validators.dart';
import 'package:dataontest/app/data/widgets/button_default.dart';
import 'package:dataontest/app/data/widgets/input_password.dart';
import 'package:dataontest/app/data/widgets/input_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: GetBuilder<LoginController>(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.key,
              child: ListView(
                children: [
                  const Text("Email"),
                  const SizedBox(height: 8),
                  InputText(
                    hintText: "Enter Email",
                    controller: controller.username,
                    onChanged: (_) => controller.onChanged(),
                    validator: (v) => valEmail!(v, 'Email'),
                  ),
                  const SizedBox(height: 16),
                  const Text("Password"),
                  const SizedBox(height: 8),
                  InputPassword(
                    hintText: 'Password',
                    controller: controller.password,
                    onChanged: (_) => controller.onChanged(),
                    validator: (v) => valPassword!(v, 'Password'),
                  ),
                  const SizedBox(height: 32),
                  ButtonDefault(
                    text: 'Login',
                    color:
                        !controller.isComplete ? Colors.grey[350] : Colors.blue,
                    onTap:
                        !controller.isComplete ? () {} : controller.handleLogin,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
