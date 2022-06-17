import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/button_widget.dart';
import 'package:student_fitness/widget/custom_snackbar.dart';
import 'package:student_fitness/widget/text_field_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Center(child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<AuthController>(builder: (authController) {
            return Column(children: [

              Text('Hey there,', style: poppinsRegular.copyWith(fontSize: 16)),
              const SizedBox(height: 5),
              Text('Welcome Back', style: poppinsBold.copyWith(fontSize: 20)),
              const SizedBox(height: 30),

              TextFieldWidget(
                hintText: 'Email',
                controller: _emailController,
                focusNode: _emailNode,
                nextFocus: _passNode,
                inputType: TextInputType.emailAddress,
                prefixIcon: Images.email,
              ),
              const SizedBox(height: 20),

              TextFieldWidget(
                hintText: 'Password',
                controller: _passController,
                focusNode: _passNode,
                inputAction: TextInputAction.done,
                inputType: TextInputType.visiblePassword,
                prefixIcon: Images.lock,
                isPassword: true,
              ),
              const SizedBox(height: 20),

              InkWell(
                onTap: () => Get.toNamed(Routes.getForgetRoute()),
                child: Text('Forgot your password?', style: poppinsMedium.copyWith(fontSize: 12, color: Theme.of(context).hintColor)),
              ),
              const SizedBox(height: 50),

              !authController.isLoading ? ButtonWidget(
                buttonText: 'Login',
                preIcon: Icons.login,
                onPressed: () {
                  String _email = _emailController.text.trim();
                  String _password = _passController.text.trim();
                  if(_email.isEmpty) {
                    showCustomSnackBar('Enter email address');
                  }else if(!GetUtils.isEmail(_email)) {
                    showCustomSnackBar('Enter valid email address');
                  }else if(_password.isEmpty) {
                    showCustomSnackBar('Enter a password');
                  }else if(_password.length < 8) {
                    showCustomSnackBar('Minimum length of password is 8');
                  }else {
                    authController.loginUser(_email, _password);
                  }
                },
              ) : const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 30),

              Row(children: [
                Expanded(child: Divider(color: Theme.of(context).hintColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Or', style: poppinsRegular.copyWith(fontSize: 12)),
                ),
                Expanded(child: Divider(color: Theme.of(context).hintColor)),
              ]),
              const SizedBox(height: 30),

              InkWell(
                onTap: () => Get.toNamed(Routes.getSignUpRoute()),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('Don’t have an account yet?', style: poppinsRegular),
                    const SizedBox(width: 5),
                    Text('Register', style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor)),
                  ]),
                ),
              ),

            ]);
          }),
        )),
      ),
    );
  }
}
