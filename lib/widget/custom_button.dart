import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txButton;
  final dynamic onPressed;
  final IconData? icon;
  const CustomButton({
    Key? key,
    required this.txButton,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      margin: const EdgeInsets.only(top: 20),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.brown,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 197, 187, 154),
            ),
            const SizedBox(width: 5,),
            Text(
              txButton,
              style: const TextStyle(color: Color.fromARGB(255, 197, 187, 154)),
            ),
          ],
        ),
      ),
    );
  }
}
