import 'package:flutter/material.dart';
import 'package:tahap_2/theme/colors.dart';

class CustomDropDown extends StatelessWidget {
  final String label;
  final List items;
  final dynamic value;
  final dynamic onChanged;
  const CustomDropDown({
    Key? key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 2, left: 20, right: 20),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Major',
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
        value: value,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
