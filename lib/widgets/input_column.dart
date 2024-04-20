import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:super_fam_project/Screens/home_screen.dart';
import 'package:super_fam_project/controllers/getxcontroller.dart';
import 'package:super_fam_project/widgets/custom_textfield.dart';
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
        width: width > 400 ? 400 : 300,
        height: height > 600 ? 500 : 400,
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
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _enterPhoneTextField(context),
                  const SizedBox(
                    height: 10,
                  ),
                  if (controller.isValidNumber.value &&
                      !controller.isOTPValid.value)
                    _enterOTPField(context),
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
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            String val = emailcontroller.text;
                            int? parsedValue = int.tryParse(val);
                            print("Number $val");
                            if (val.length != 10 || parsedValue == null) {
                              showSnackBar(context,
                                  "Enter Correct Contact number Here in Filed..");
                            } else {
                              showDetails(context, "OTP Sent To Contact.");
                              await const Duration(seconds: 4);
                              controller.isValidNumber.value = true;
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
                  if (controller.isValidNumber.value &&
                      !controller.isOTPSent.value)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextButton(
                          onPressed: () {
                            String val = otpcontroller.text;
                            if (val.length != 6) {
                              showSnackBar(context, "Enter Correct OTP.");
                            } else {
                              controller.validateOTP();
                              Get.toNamed('/home');
                            }
                          },
                          child: const Text(
                            'Validate OTP',
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
          fontSize: 10,
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
        prefixIcon: const Icon(Icons.call),
        suffixIcon: GestureDetector(
            onTap: () {
              showDetails(context, "info");
            },
            child: const Icon(Icons.info)),
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
        color: Color.fromRGBO(30, 60, 87, 1),
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
      validator: (value) {
        return value == '123456' ? null : 'Pin is incorrect';
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
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
