import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/model/user_model.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/routes.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/button_widget.dart';
import 'package:student_fitness/widget/custom_snackbar.dart';
import 'package:student_fitness/widget/text_field_widget.dart';

class ProfileEditPage extends StatefulWidget {
  final UserModel? user;
  final bool? fromProfile;
  const ProfileEditPage({Key? key, @required this.user, @required this.fromProfile}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final FocusNode _dobNode = FocusNode();
  final FocusNode _weightNode = FocusNode();
  final FocusNode _heightNode = FocusNode();
  DateTime? _dob;
  String? _gender;

  @override
  void initState() {
    super.initState();

    if(widget.fromProfile!) {
      _gender = widget.user!.gender;
      _dob = widget.user!.dob;
      _dobController.text = DateFormat('dd MMMM yyyy').format(_dob!);
      _weightController.text = widget.user!.weight.toString();
      _heightController.text = widget.user!.height.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [

          Container(
            height: context.height * 0.40, alignment: Alignment.center,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 100),
            color: Theme.of(context).secondaryHeaderColor,
            child: SafeArea(child: Image.asset(Images.register, height: context.height * 0.30)),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [

              Text('Let’s complete your profile', style: poppinsBold.copyWith(fontSize: 20)),
              const SizedBox(height: 5),

              Text(
                'It will help us to know more about you!',
                style: poppinsRegular.copyWith(fontSize: 12, color: Theme.of(context).hintColor),
              ),
              const SizedBox(height: 30),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).shadowColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: Color(0xFFF7F8F8), spreadRadius: 1, blurRadius: 5)],
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(Images.gender, height: 20, width: 20),
                  ),
                  Expanded(child: DropdownButton<String>(
                    value: _gender,
                    underline: const SizedBox(),
                    hint: Text('Choose Gender', style: poppinsRegular.copyWith(fontSize: 12, color: Theme.of(context).hintColor)),
                    items: <String>['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: poppinsRegular.copyWith(fontSize: 12)),
                      );
                    }).toList(),
                    isExpanded: true,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  )),
                ]),
              ),
              const SizedBox(height: 20),

              InkWell(
                onTap: () async {
                  DateTime? _date = await showDatePicker(
                    context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now(),
                  );
                  if(_date != null) {
                    setState(() {
                      _dob = _date;
                      _dobController.text = DateFormat('dd MMMM yyyy').format(_date);
                    });
                  }
                },
                child: TextFieldWidget(
                  hintText: 'Date of Birth',
                  controller: _dobController,
                  focusNode: _dobNode,
                  nextFocus: _weightNode,
                  inputType: TextInputType.datetime,
                  prefixIcon: Images.calendar,
                  isEnabled: false,
                ),
              ),
              const SizedBox(height: 20),

              Row(children: [
                Expanded(child: TextFieldWidget(
                  hintText: 'Your Weight',
                  controller: _weightController,
                  focusNode: _weightNode,
                  nextFocus: _heightNode,
                  inputType: TextInputType.number,
                  prefixIcon: Images.weight,
                )),
                const SizedBox(width: 20),
                Container(
                  height: 50, width: 50, alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFEF5DA8), Color(0xFFC58BF2)],
                    ),
                  ),
                  child: Text('KG', style: poppinsMedium.copyWith(fontSize: 12, color: Colors.white)),
                ),
              ]),
              const SizedBox(height: 20),

              Row(children: [
                Expanded(child: TextFieldWidget(
                  hintText: 'Your Height',
                  controller: _heightController,
                  focusNode: _heightNode,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.number,
                  prefixIcon: Images.height,
                )),
                const SizedBox(width: 20),
                Container(
                  height: 50, width: 50, alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFEF5DA8), Color(0xFFC58BF2)],
                    ),
                  ),
                  child: Text('CM', style: poppinsMedium.copyWith(fontSize: 12, color: Colors.white)),
                ),
              ]),
              const SizedBox(height: 30),

              GetBuilder<AuthController>(builder: (authController) {
                return !authController.isLoading ? ButtonWidget(
                  buttonText: 'Next',
                  postIcon: Icons.navigate_next,
                  onPressed: () {
                    if(_gender == null) {
                      showCustomSnackBar('Select your gender');
                    }else if(_dob == null) {
                      showCustomSnackBar('Select your date of birth');
                    }else if(_weightController.text.trim().isEmpty) {
                      showCustomSnackBar('Enter your weight');
                    }else if(_heightController.text.trim().isEmpty) {
                      showCustomSnackBar('Enter your height');
                    }else {
                      UserModel _user = UserModel(
                        name: widget.user!.name, gender: _gender, dob: _dob, weight: double.parse(_weightController.text.trim()),
                        height: double.parse(_heightController.text.trim()), uid: widget.user!.uid,
                      );
                      authController.updateUserProfile(_user).then((value) {
                        if(widget.fromProfile!) {
                          Get.back();
                          showCustomSnackBar('Profile updated successfully', isError: false);
                        }else {
                          Get.toNamed(Routes.getGoalRoute(_user));
                        }
                      });
                    }
                  },
                ) : const Center(child: CircularProgressIndicator());
              }),

            ]),
          ),

        ]),
      ),
    );
  }
}
