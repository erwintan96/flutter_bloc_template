class RegexUtil{
  static RegExp getRegexForEmail(){
    return new RegExp("(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+)");
  }

  static RegExp getRegexForPhoneNumber(){
    return new RegExp("(\\+?[2-9]{2}|0)\\d{4,}\$");
  }

  static RegExp getRegexForPassword(){
    return new RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$",
      caseSensitive: true,
      multiLine: false,
    );
  }

  static bool isEmailValid(String email){
    email = email.trim();
    final RegExp regExpEmail = RegexUtil.getRegexForEmail();
    if(regExpEmail.firstMatch(email) != null){
      return true;
    }else{
      return false;
    }
  }

  static bool isPhoneNumberValid(String phoneNumber){
    phoneNumber = phoneNumber.trim();
    final RegExp regExpPhone = RegexUtil.getRegexForPhoneNumber();
    if(regExpPhone.firstMatch(phoneNumber) != null){
      return true;
    }else{
      return false;
    }
  }

  static bool isPasswordValid(String password){
    final RegExp regExp = RegexUtil.getRegexForPassword();
    if (regExp.firstMatch(password) == null) {
      return false;
    }
    return true;
  }

}