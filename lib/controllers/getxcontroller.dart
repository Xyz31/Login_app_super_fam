import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString phoneNumber = "".obs;
  RxString otp = "".obs;
  RxString mainText = "Login".obs;
  RxBool isOTP6digit = false.obs;
  RxBool isOTPSent = false.obs;
  RxBool isValidNumber = false.obs;
  RxBool isNumber10digit = false.obs;

  void checkValidNumber() {
    // Make Valid here
    isValidNumber.value = true;
  }

  void sendOTP() {
    // Implement the logic to send OTP to the entered phone number
    isOTPSent.value = true;
  }

  void validateOTP() {
    // Implement the logic to validate the OTP
    isOTP6digit.value = true;
  }

  void login() {
    // Implement the login logic
  }

  void resetCredentials() {
    mainText.value = "Login";
    phoneNumber.value = "";
    otp.value = "";
    isOTPSent.value = false;
    isOTP6digit.value = false;
    isValidNumber.value = false;
    isNumber10digit.value = false;
  }
}
