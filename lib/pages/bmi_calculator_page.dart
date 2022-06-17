import 'package:flutter/material.dart';
import 'package:student_fitness/util/styles.dart';
import 'package:student_fitness/widget/app_bar_widget.dart';
import 'package:student_fitness/widget/bg_widget.dart';
import 'package:student_fitness/widget/button_widget.dart';
import 'package:student_fitness/widget/custom_snackbar.dart';
import 'package:student_fitness/widget/text_field_widget.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final FocusNode _weightNode = FocusNode();
  final FocusNode _heightNode = FocusNode();
  double? _bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: const AppbarWidget(title: 'BMI Calculator'),
      body: BgWidget(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(children: [

            Text('Are You Healthy ? Know Your BMI', style: poppinsBold.copyWith(fontSize: 16)),
            const SizedBox(height: 20),

            Row(children: [
              Expanded(flex: 5, child: Text('Weight', style: poppinsMedium.copyWith(fontSize: 16))),
              const SizedBox(width: 10),
              Expanded(flex: 8, child: TextFieldWidget(
                controller: _weightController,
                hintText: 'Weight',
                focusNode: _weightNode,
                inputType: TextInputType.number,
                nextFocus: _heightNode,
              )),
              const SizedBox(width: 10),
              const Expanded(flex: 7, child: Text('Kilograms', style: poppinsMedium)),
            ]),
            const SizedBox(height: 10),

            Row(children: [
              Expanded(flex: 5, child: Text('Height', style: poppinsMedium.copyWith(fontSize: 16))),
              const SizedBox(width: 10),
              Expanded(flex: 8, child: TextFieldWidget(
                controller: _heightController,
                hintText: 'Height',
                focusNode: _heightNode,
                inputType: TextInputType.number,
                inputAction: TextInputAction.done,
              )),
              const SizedBox(width: 10),
              const Expanded(flex: 7, child: Text('Centimeters ', style: poppinsMedium)),
            ]),
            const SizedBox(height: 30),

            ButtonWidget(
              buttonText: 'Calculate',
              onPressed: () {
                String _weight = _weightController.text.trim();
                String _height = _heightController.text.trim();
                if(_weight.isEmpty) {
                  showCustomSnackBar('Enter your height');
                }else if(_height.isEmpty) {
                  showCustomSnackBar('Enter your weight');
                }else {
                  setState(() {
                    _bmi = double.parse(_weight) / ((double.parse(_height)/100) * (double.parse(_height)/100));
                  });
                }
              },
            ),
            const SizedBox(height: 30),

            if(_bmi != null) Column(children: [
              Text('Your BMI', style: poppinsRegular.copyWith(fontSize: 16)),
              const SizedBox(height: 10),
              Text(_bmi!.toStringAsFixed(1), style: poppinsBold.copyWith(fontSize: 16, color: const Color(0xFFCAAD15))),
              const SizedBox(height: 30),
            ]),

            DataTable(
              columnSpacing: 50,
              headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                return const Color(0xFFC4C4C4);
              }),
              showCheckboxColumn: false,
              headingRowHeight: 40,
              columns: const [
                DataColumn(label: Flexible(child: Text(
                  'BMI Value (male/female)', style: poppinsRegular, textAlign: TextAlign.center,
                ))),
                DataColumn(label: Flexible(child: Text(
                  'Weight Status', style: poppinsRegular, textAlign: TextAlign.center,
                ))),
              ],
              rows: [
                _getDataRow('Below 21', 'Under Weight', const Color(0xFFC34646)),
                _getDataRow('21 - 26.4', 'Healthy', const Color(0xFF55AF0E)),
                _getDataRow('26.4 - 27.8', 'Marinally Over weight', const Color(0xFFEF9815)),
                _getDataRow('27.8 - 31.1', 'Over Weight', const Color(0xFFD51CB7)),
                _getDataRow('Above 31.1', 'Obese', const Color(0xFFC00202)),
              ],
            ),

          ]),
        ),
      ),
    );
  }

  DataRow _getDataRow(String bmi, String status, Color statusColor) {
    return DataRow(
      cells: [
        DataCell(Center(child: Text(bmi, textAlign: TextAlign.center, style: poppinsRegular))),
        DataCell(Center(child: Text(status, textAlign: TextAlign.center, style: poppinsRegular.copyWith(color: statusColor)))),
      ],
    );
  }

}

