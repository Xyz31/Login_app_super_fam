import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString phoneNumber = "".obs;
  RxString otp = "".obs;
  RxString mainText = "Login".obs;
  RxBool isOTPValid = false.obs;
  RxBool isOTPSent = false.obs;
  RxBool isValidNumber = false.obs;

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
    isOTPValid.value = true;
  }

  void login() {
    // Implement the login logic
  }
}
