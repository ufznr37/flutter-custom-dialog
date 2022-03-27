import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/custom_dialog/credit_card_validation.dart';
import 'package:flutter_custom_dialog/custom_dialog/credit_formatters.dart';

class CreditCard {
  final String cardNumber;
  final String cardHolder;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;

  CreditCard(
      {required this.cardNumber,
      required this.cardHolder,
      required this.expiryMonth,
      required this.expiryYear,
      required this.cvv});
}

class CreditCardDialog extends StatelessWidget {
  CreditCardDialog({Key? key, this.onConfirm}) : super(key: key);

  final Function(CreditCard creditCard)? onConfirm;
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  void _onPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final cardNumber = _numberController.text.toString().replaceAll(' ', '');
      final cardHolder = _nameController.text.toString();
      final expiryDateSplit = _expiryController.text.toString().split('/');
      final expiryMonth = expiryDateSplit[0];
      final expiryYear = expiryDateSplit[1];
      final cvv = _cvvController.text.toString();
      onConfirm?.call(CreditCard(
          cardNumber: cardNumber,
          cardHolder: cardHolder,
          expiryMonth: expiryMonth,
          expiryYear: expiryYear,
          cvv: cvv));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter(),
                      ],
                      validator: (value) {
                        if (CreditCardValidation.isCardNumber(value)) {
                          return null;
                        }
                        return "Invalid Card number";
                      },
                      decoration: const InputDecoration(
                        labelText: "Number",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (CreditCardValidation.isName(value)) {
                          return null;
                        }
                        return "Invalid Name";
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _expiryController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter()
                            ],
                            decoration: const InputDecoration(
                              labelText: "Expire",
                            ),
                            validator: (value) {
                              if (CreditCardValidation.isExpiryDate(value)) {
                                return null;
                              }
                              return "Invalid Expiry date";
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _cvvController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              labelText: "CVV",
                            ),
                            validator: (value) {
                              if (CreditCardValidation.isCvv(value)) {
                                return null;
                              }
                              return 'Invalid CVV';
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => _onPressed(context),
                          child: const Text("Confirm")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
