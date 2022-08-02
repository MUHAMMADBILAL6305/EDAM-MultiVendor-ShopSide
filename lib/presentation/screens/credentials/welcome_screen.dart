import 'package:edam_merchant/presentation/screens/credentials/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configurations/utils/my_app_colors.dart';
import '../my_widgets/my_large_button.dart';
import 'log_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * .15),
              Image.asset(
                'assets/images/Welcome.png',
              ),
              SizedBox(height: Get.height * .01),
              Text(
                "Welcome", style: Theme.of(context).textTheme.headline6,
                // style: TextStyle(
                //   fontFamily: 'Inter',
                //   fontStyle: FontStyle.normal,
                //   fontWeight: FontWeight.w700,
                //   fontSize: 14,
                //   color: MyAppColors.appPrimaryColor,
                // ),
              ),
              // Divider(color: Theme.of(context).dividerColor,),
              const SizedBox(height: 8),
              const Text(
                "Enjoy our best eShop experience ever.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  letterSpacing: -0.5,
                  height: 1.1,
                  color: Color(0xff1E1A15),
                ),
              ),
              SizedBox(height: Get.height * .2),
              MyLargeButton(
                  title: 'Create an account',
                  buttonColor: MyAppColors.appPrimaryColor,
                  isShadow: true,
                  onTap: () {
                    Get.to(const SignUpScreen());
                  }),
              const SizedBox(height: 8),
              MyLargeButton(
                  title: 'LogIn',
                  isShadow: true,
                  buttonColor: Colors.white,
                  titleColor: MyAppColors.appPrimaryColor,
                  borderColor: MyAppColors.appPrimaryColor,
                  onTap: () {
                    Get.to(const LogInScreen());
                  }),
              const SizedBox(height: 8),
            ],
          ),
        )),
      ),
    );
  }
}
