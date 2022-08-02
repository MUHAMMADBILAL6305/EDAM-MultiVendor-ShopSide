import 'package:flutter/material.dart';
import '../../../configurations/utils/my_app_colors.dart';

class RoundRectangleImageButton extends StatelessWidget {
   const RoundRectangleImageButton({
    this.imagePath,
    this.onTap,
  });

  final String? imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: MyAppColors.appPrimaryColor,
        elevation: 2,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 5,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Image.asset(
        imagePath.toString(),
        height: 30,
      ),
    );
  }
}
