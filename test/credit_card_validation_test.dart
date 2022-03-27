import 'package:flutter_custom_dialog/custom_dialog/credit_card_validation.dart';
import 'package:test/test.dart';

void main() {
  test('Credit card number', () {
    expect(CreditCardValidation.isCardNumber("1234567890123456"), true);
    expect(CreditCardValidation.isCardNumber("1234 5678 9012 3456"), true);
    expect(CreditCardValidation.isCardNumber("1234 5678 9012 3456 789"), false);
    expect(CreditCardValidation.isCardNumber("abcd 5678 9012 3456 789"), false);
    expect(CreditCardValidation.isCardNumber("1234 5678 9012"), false);
  });

  test('Expiry date format', () {
    expect(CreditCardValidation.isExpiryDateFormat("12/12"), true);
    expect(CreditCardValidation.isExpiryDateFormat("02/02"), true);
    expect(CreditCardValidation.isExpiryDateFormat("00/02"), false);
    expect(CreditCardValidation.isExpiryDateFormat("13/02"), false);
    expect(CreditCardValidation.isExpiryDateFormat("20/02"), false);
    expect(CreditCardValidation.isExpiryDateFormat("02/023"), false);
    expect(CreditCardValidation.isExpiryDateFormat("2/02"), false);
    expect(CreditCardValidation.isExpiryDateFormat("02/2"), false);
    expect(CreditCardValidation.isExpiryDateFormat("2/2"), false);
    expect(CreditCardValidation.isExpiryDateFormat("12345"), false);
  });

  test('Expiry date current', () {
    expect(CreditCardValidation.isExpiryDateCurrent('12', '25'), true);
    expect(CreditCardValidation.isExpiryDateCurrent('05', '25'), true);
    expect(CreditCardValidation.isExpiryDateCurrent('05', '20'), false);
    expect(CreditCardValidation.isExpiryDateCurrent('01', '23'), true);
    expect(CreditCardValidation.isExpiryDateCurrent('02', '25'), true);
    final current = DateTime.now();
    final month = current.month.toString().padRight(2, '0');
    final year = current.year.toString();
    expect(
        CreditCardValidation.isExpiryDateCurrent(
            month, year.substring(2, year.length)),
        true);
  });

  test('Expiry date', () {
    expect(CreditCardValidation.isExpiryDate('12/25'), true);
    expect(CreditCardValidation.isExpiryDate('22/25'), false);
    expect(CreditCardValidation.isExpiryDate('22025'), false);
    expect(CreditCardValidation.isExpiryDate('02/20'), false);
    expect(CreditCardValidation.isExpiryDate('12/22'), true);
    expect(CreditCardValidation.isExpiryDate('02/25'), true);
    expect(CreditCardValidation.isExpiryDate('12/20'), false);
  });
}
