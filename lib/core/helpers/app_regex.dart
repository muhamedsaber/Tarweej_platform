class AppRegex {
  static final RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp password = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static final RegExp phone = RegExp(r'^[0-9]{10}$');
  static final RegExp name = RegExp(r'^[a-zA-Z ]+$');
  static final RegExp number = RegExp(r'^[0-9]+$');
  static final RegExp alphaNumeric = RegExp(r'^[a-zA-Z0-9]+$');
  static final RegExp alphaNumericWithSpace = RegExp(r'^[a-zA-Z0-9 ]+$');
  static final RegExp alphaNumericWithSpecialChar = RegExp(r'^[a-zA-Z0-9!@#\$%^&*()_+]+$');
  static final RegExp alphaNumericWithSpaceSpecialChar = RegExp(r'^[a-zA-Z0-9!@#\$%^&*()_+ ]+$');
  static final RegExp url = RegExp(r'^http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$');
  static final RegExp pinCode = RegExp(r'^[0-9]{6}$');
  static final RegExp aadhar = RegExp(r'^[0-9]{12}$');
  static final RegExp pan = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
  static final RegExp gst = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$');
  static final RegExp ifsc = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
  static final RegExp micr = RegExp(r'^[0-9]{9}$');
  static final RegExp swift = RegExp(r'^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$');
  static final RegExp cvv = RegExp(r'^[0-9]{3,4}$');
  static final RegExp otp = RegExp(r'^[0-9]{4}$');
  static final RegExp otp6 = RegExp(r'^[0-9]{6}$');

  static final RegExp isPasswordContainsLowerCase= RegExp(r'[a-z]');
  static final RegExp isPasswordContainsUpperCase= RegExp(r'[A-Z]');
  static final RegExp isPasswordContainsNumber= RegExp(r'[0-9]');
  static final RegExp isPasswordContainsSpecialCharacter= RegExp(r'[!@#\$%^&*()_+]');
  static final RegExp isPasswordLengthValid= RegExp(r'^.{8,}$');


}  