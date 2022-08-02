import 'package:flutter/material.dart';

class MyLargeButton extends StatelessWidget {
  const MyLargeButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.buttonColor,
      this.titleColor = Colors.white,
      this.borderColor = Colors.transparent,
      this.isShadow = true})
      : super(key: key);

  final bool isShadow;
  final Color buttonColor, titleColor, borderColor;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: isShadow ? 5 : 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        onPressed: onTap,
        child: Text(
          title.toString(),
          style: TextStyle(
            color: titleColor,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
