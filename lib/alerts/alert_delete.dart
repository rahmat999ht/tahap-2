import 'package:flutter/material.dart';

class AlertDelete extends StatelessWidget {
  final void Function()? onPressedNo;
  final void Function()? onPressedYes;
  const AlertDelete({
    Key? key,
    required this.onPressedNo,
    required this.onPressedYes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yakin hapus data ini ??'),
      actions: [
        TextButton(
          onPressed: onPressedNo,
          child: const Text(
            'No',
          ),
        ),
        TextButton(
          onPressed: onPressedYes,
          child: const Text(
            'Yes',
          ),
        ),
      ],
    );
  }
}
