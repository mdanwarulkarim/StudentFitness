import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_fitness/controllers/auth_controoller.dart';
import 'package:student_fitness/util/images.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/button_widget.dart';
import 'package:student_fitness/widget/custom_snackbar.dart';
import 'package:student_fitness/widget/text_field_widget.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _progressController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Text('Update your weight for this month', style: poppinsMedium.copyWith(fontSize: 16)),
          const SizedBox(height: 20),

          TextFieldWidget(
            hintText: 'Your Weight',
            controller: _progressController,
            inputType: TextInputType.number,
            prefixIcon: Images.weight,
            inputAction: TextInputAction.done,
          ),
          const SizedBox(height: 30),

          GetBuilder<AuthController>(builder: (authController) {
            return !authController.isLoading ? ButtonWidget(
              buttonText: 'Update Weight',
              onPressed: () async {
                String _weight = _progressController.text.trim();
                if(_weight.isEmpty) {
                  showCustomSnackBar('Enter your weight');
                }else {
                  authController.updateProgress(double.parse(_weight));
                }
              },
            ) : const Center(child: CircularProgressIndicator());
          }),

        ]),
      ),
    );
  }
}
