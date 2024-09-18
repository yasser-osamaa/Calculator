import 'package:flutter/material.dart';

class CustomCalcButton extends StatelessWidget {
  const CustomCalcButton(
      {super.key,
      required this.calcBtn,
      required this.txtColor,
      required this.backgroundColor,
      required this.onTap});
  final String calcBtn;
  final Color txtColor;
  final Color backgroundColor;
  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => onTap(calcBtn),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(9),
          ),
          width: 73,
          height: 75,
          child: Center(
            child: Text(
              calcBtn,
              style: TextStyle(
                fontSize: 36,
                color: txtColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
