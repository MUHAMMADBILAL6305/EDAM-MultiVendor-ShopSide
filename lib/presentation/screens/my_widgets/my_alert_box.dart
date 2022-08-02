import 'package:flutter/material.dart';

import '../../../configurations/utils/my_app_colors.dart';

myAlertBox({
  required BuildContext context,
  required Function() okTap,
  required Function() cancelTap,
  required String title,
  required String subtitle,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(
          title,
              // "Password Reset successfully",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              // height: Get.height*.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 0.5,
                          color: Theme.of(context).dividerColor,
                          style: BorderStyle.solid))),
              child: TextButton(
                onPressed: okTap,
                //     () {
                //   // Get.off(MyNavBar());
                // },
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: MyAppColors.appPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
