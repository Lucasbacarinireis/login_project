import 'package:flutter/material.dart';
import 'package:login_project/components/login/custom_login_button_component.dart';
import 'package:login_project/components/widgets/custom_text_field_widget.dart';
import 'package:login_project/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.3,
            ),
            CustomTextFieldWidget(
                onChanged: _loginController.setLogin, label: 'Login'),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
              onChanged: _loginController.setPassword,
              label: 'Senha',
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomLoginButtonComponent(loginController: _loginController),
          ],
        ),
      ),
    );
  }
}
