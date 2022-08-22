import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import '../widget/custom_dropdown.dart';
import '../widget/custom_form_input.dart';

class FormInput extends StatefulWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final List itemsMajor = ['Tehnik Infomatika', 'Sistem Imformatika'];
  String valueMajor = 'Tehnik Infomatika';

  final List itemsGender = ['Laki-laki', 'Perempuan'];
  String valueGender = 'Laki-laki';

  @override
  void initState() {
    super.initState();
    valueMajor = itemsMajor[0];
    valueGender = itemsGender[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Form Add data',
              style: TextStyle(fontSize: 30, color: Colors.brown),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomFormInput(
              label: 'Name',
            ),
            const CustomFormInput(
              label: 'Stb',
            ),
            CustomDropDown(
              label: 'Major',
              items: itemsMajor,
              value: valueMajor,
              onChanged: (newValue) {
                setState(
                  () {
                    newValue = valueMajor;
                  },
                );
              },
            ),
            CustomDropDown(
              label: 'Gender',
              items: itemsGender,
              value: valueGender,
              onChanged: (newValue) {
                setState(
                  () {
                    newValue = valueGender;
                  },
                );
              },
            ),
            const CustomFormInput(
              label: 'Address',
            ),
            CustomButton(
              icon: Icons.save_rounded,
              txButton: 'Save',
              onPressed: () {},
            ),
            CustomButton(
              icon: Icons.cancel_rounded,
              txButton: 'Cancel',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
