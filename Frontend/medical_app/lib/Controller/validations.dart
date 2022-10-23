String? emailValidation(String? value) {
  bool emailValidator = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
  return emailValidator == false ? "الايميل غير صحيح" : null;
}

String? nameValidation(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return 'الاسم لا يجب ان يكون فارغ';
    } else if (value.length <= 2) {
      return 'الاسم قصير';
    }
  }
}

String? numberValidation(String? value){
  if (value != null) {
    if (value.isEmpty) {
      return 'الرجاء ادخال رقم الهاتف';
    } else if (value.length < 11) {
      return 'رقم الهاتف قصير';
    }
  }
}