import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/button_widget.dart';
import 'package:student_fitness/widget/custom_snackbar.dart';
import 'package:student_fitness/widget/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FocusNode _fNameNode = FocusNode();
  final FocusNode _lNameNode = FocusNode();
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

              Text('Create an Account', style: poppinsBold.copyWith(fontSize: 20)),
              const SizedBox(height: 30),

              TextFieldWidget(
                hintText: 'First Name',
                controller: _fNameController,
                focusNode: _fNameNode,
                nextFocus: _lNameNode,
                inputType: TextInputType.name,
                prefixIcon: Images.user,
                capitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 20),

              TextFieldWidget(
                hintText: 'Last Name',
                controller: _lNameController,
                focusNode: _lNameNode,
                nextFocus: _emailNode,
                inputType: TextInputType.name,
                prefixIcon: Images.user,
                capitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 20),

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

              Row(children: [

                Checkbox(
                  value: authController.isChecked,
                  activeColor: Theme.of(context).primaryColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool? isCheck) => authController.toggleCheck(),
                ),

                Expanded(child: Text(
                  'By continuing you accept our Privacy Policy and Term of Use',
                  style: poppinsRegular.copyWith(color: Theme.of(context).hintColor, fontSize: 10),
                )),

              ]),
              const SizedBox(height: 50),

              !authController.isLoading ? ButtonWidget(
                buttonText: 'Register',
                onPressed: () {
                  String _fName = _fNameController.text.trim();
                  String _lName = _lNameController.text.trim();
                  String _email = _emailController.text.trim();
                  String _password = _passController.text.trim();
                  if(_fName.isEmpty) {
                    showCustomSnackBar('Enter first name');
                  }else if(_lName.isEmpty) {
                    showCustomSnackBar('Enter last name');
                  }else if(_email.isEmpty) {
                    showCustomSnackBar('Enter email address');
                  }else if(!GetUtils.isEmail(_email)) {
                    showCustomSnackBar('Enter valid email address');
                  }else if(_password.isEmpty) {
                    showCustomSnackBar('Enter a password');
                  }else if(_password.length < 8) {
                    showCustomSnackBar('Minimum length of password is 8');
                  }else if(!authController.isChecked) {
                    showCustomSnackBar('Accept terms and conditions');
                  }else {
                    authController.registerUser(_email, _password, _fName, _lName);
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
                onTap: () => Get.toNamed(Routes.getSignInRoute()),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('Already have an account?', style: poppinsRegular),
                    const SizedBox(width: 5),
                    Text('Login', style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor)),
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
