
class PasswordState {
  final bool isPasswordContainsUpperCase;
  final bool isPasswordContainsLowerCase;
  final bool isPasswordContainsNumber;
  final bool isPasswordContainsSpecialCharacter;
  final bool isPasswordLengthValid;

  PasswordState({
    this.isPasswordContainsUpperCase = false,
    this.isPasswordContainsLowerCase = true,
    this.isPasswordContainsNumber = false,
    this.isPasswordContainsSpecialCharacter = false,
    this.isPasswordLengthValid = false,
  });
  copyWith({
    bool? isPasswordContainsUpperCase,
    bool? isPasswordContainsLowerCase,
    bool? isPasswordContainsNumber,
    bool? isPasswordContainsSpecialCharacter,
    bool? isPasswordLengthValid,
  }) {
    return PasswordState(
      isPasswordContainsUpperCase: isPasswordContainsUpperCase ??  this.isPasswordContainsUpperCase,
      isPasswordContainsLowerCase: isPasswordContainsLowerCase ?? this.isPasswordContainsLowerCase,
      isPasswordContainsNumber: isPasswordContainsNumber ??  this.isPasswordContainsNumber,
      isPasswordContainsSpecialCharacter:
          isPasswordContainsSpecialCharacter ??  this.isPasswordContainsSpecialCharacter,
      isPasswordLengthValid: isPasswordLengthValid ??   this.isPasswordLengthValid,
    );
  }

  bool get isPasswordValid {

    return isPasswordContainsUpperCase &&
        isPasswordContainsLowerCase &&
        isPasswordContainsNumber &&
        isPasswordContainsSpecialCharacter &&
        isPasswordLengthValid;
  }

  @override
  String toString() {
    return "$PasswordState: {isPasswordContainsUpperCase: $isPasswordContainsUpperCase, isPasswordContainsLowerCase: $isPasswordContainsLowerCase, isPasswordContainsNumber: $isPasswordContainsNumber, isPasswordContainsSpecialCharacter: $isPasswordContainsSpecialCharacter, isPasswordLengthValid: $isPasswordLengthValid}";
  }
}
