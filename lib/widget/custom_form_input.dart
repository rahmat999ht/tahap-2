import 'package:flutter/material.dart';

class CustomFormInput extends StatelessWidget {
  final String label;
  const CustomFormInput({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 2, left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.brown,
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
