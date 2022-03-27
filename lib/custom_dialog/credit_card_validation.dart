class CreditCardValidation {
  CreditCardValidation._();

  static bool isCardNumber(String? cardNumber) {
    if (cardNumber == null) {
      return false;
    } else {
      final _cardNumber = cardNumber.replaceAll(' ', '');
      final reg = RegExp(r'^[0-9]{16}$');
      return reg.hasMatch(_cardNumber);
    }
  }

  static bool isExpiryDate(String? expiryDate) {
    if (isExpiryDateFormat(expiryDate)) {
      if (expiryDate != null) {
        final split = expiryDate.split('/');
        if (isExpiryDateCurrent(split[0], split[1])) {
          return true;
        }
      }
    }
    return false;
  }

  static bool isExpiryDateCurrent(String month, String year) {
    if (month.isNotEmpty && year.isNotEmpty) {
      try {
        final nMonth = int.parse(month);
        final nYear = int.parse('20$year');
        final date = DateTime.now();
        if (nYear > date.year) {
          return true;
        } else if(nYear == date.year) {
          if (nMonth >= (date.month)) {
            return true;
          }
          return false;
        } else {
          return false;
        }
      } catch(e) {
        return false;
      }
    }
    return false;
  }

  static bool isExpiryDateFormat(String? expiryDate) {
    if (expiryDate == null) {
      return false;
    } else {
      // yy/mm
      if (expiryDate.length == 5) {
        final reg = RegExp(r'^(0[1-9]|1[0-2])[/][0-9]{2}$');
        return reg.hasMatch(expiryDate);
      } else {
        return false;
      }
    }
  }

  static bool isName(String? name) {
    return name != null && name.isNotEmpty;
  }

  static bool isCvv(String? cvv) {
    return cvv != null && cvv.length == 3;
  }
}
