import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:super_fam_project/Screens/home_screen.dart';
import 'package:super_fam_project/controllers/getxcontroller.dart';
import 'package:super_fam_project/widgets/show_dialog.dart';

class InputColumnForLogin extends StatelessWidget {
  InputColumnForLogin({super.key});

  final LoginController controller = Get.put(LoginController());

  final emailcontroller = TextEditingController();
  final otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Obx(
      () => Container(
        width: width > 500 ? 350 : 300,
        // height: width > 500 ? 400 : 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              margin: const EdgeInsets.all(9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.mainText.value,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  _enterPhoneTextField(context),
                  const SizedBox(
                    height: 10,
                  ),
                  if (controller.isValidNumber.value) _enterOTPField(context),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!controller.isValidNumber.value)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: controller.isNumber10digit.value == false
                              ? Colors.grey.withOpacity(0.7)
                              : Colors.green,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextButton(
                          onPressed: () {
                            String val = emailcontroller.text;
                            int? parsedValue = int.tryParse(val);
                            debugPrint("Number $val");
                            if (val.length != 10 || parsedValue == null) {
                              showSnackBar(context,
                                  "Enter Correct Contact number Here in Filed..");
                            } else {
                              showDetails(context, "OTP Sent To Contact.");
                              const Duration(seconds: 4);
                              controller.isValidNumber.value = true;
                              controller.isOTPSent.value = true;
                              controller.mainText.value = "Enter OTP";
                            }
                          },
                          child: const Text(
                            'Send OTP',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  // if (controller.isValidNumber.value)
                  // _enterOTPField(context),
                  if (controller.isValidNumber.value)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: controller.isOTP6digit.value
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: TextButton(
                          onPressed: () {
                            String val = otpcontroller.text;
                            if (val.length != 6) {
                              showSnackBar(context, "Enter Correct OTP.");
                            } else {
                              controller.validateOTP();
                              controller.phoneNumber.value =
                                  emailcontroller.text;
                              controller.otp.value = otpcontroller.text;

                              // String num = controller.phoneNumber.value;
                              // String otp = controller.otp.value;

                              final route = CupertinoPageRoute(
                                  builder: (context) =>
                                      // HomeScreen(num: num, otp: otp));
                                      HomeScreen());
                              Navigator.pushAndRemoveUntil(
                                  context, route, (route) => false);
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _enterPhoneTextField(context) {
    return TextField(
      onChanged: (value) {
        // print(value);
        int? parsedValue = int.tryParse(value);
        if (value.length == 10 && parsedValue != null) {
          controller.phoneNumber.value = value;
          controller.isNumber10digit.value = true;
        } else {
          controller.isNumber10digit.value = false;
        }
      },
      controller: emailcontroller,
      cursorWidth: 1,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
        letterSpacing: 1,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.6),
        hintText: "Contact",
        hintStyle: TextStyle(
          letterSpacing: 1,
          fontSize: 16,
          color: Colors.white.withOpacity(0.8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: const Icon(
          Icons.call,
          color: Colors.white,
        ),
        suffixIcon: GestureDetector(
            onTap: () {
              showDetails(context, "Enter your contect");
            },
            child: const Icon(Icons.info, color: Colors.white)),
      ),
    );
  }

  Widget _enterOTPField(context) {
    const focusedBorderColor = Colors.orange;
    final fillColor = Colors.blueGrey.withOpacity(0.6);
    const borderColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.grey,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Pinput(
      length: 6,
      controller: otpcontroller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      // validator: (value) {
      //   return 'Correct pin for Testiing only $value';
      // },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        // debugPrint('onChanged: $value');
        if (value.length == 6) {
          controller.otp.value = value;
          controller.isOTP6digit.value = true;
        } else {
          controller.isOTP6digit.value = false;
        }
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
