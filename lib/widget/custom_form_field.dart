import 'package:flutter/material.dart';
import 'package:tahap_2/theme/colors.dart';

class CustomFormInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  // final void Function(String)? onChanged;
  const CustomFormInput({
    Key? key,
    required this.label,
    required this.controller,
    // this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 2, left: 20, right: 20),
      child: TextFormField(
        controller: controller,
        // onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: ColorSCustom.brownC,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown.shade200),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
