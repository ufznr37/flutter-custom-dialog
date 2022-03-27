
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/custom_dialog/credit_card_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  MaterialApp _buildAppWithDialog({ ThemeData? theme, double textScaleFactor = 1.0 }) {
    return MaterialApp(
      theme: theme,
      home: Material(
        child: Builder(
          builder: (BuildContext context) {
            return Center(
              child: ElevatedButton(
                child: const Text('X'),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CreditCardDialog();
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  testWidgets('creditCard Widget', (WidgetTester tester) async {
    await tester.pumpWidget(_buildAppWithDialog());
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Confirm'));
    await tester.pump(const Duration(milliseconds: 100)); // add delay
    final titleFinder = find.text('Invalid Card number');
    expect(titleFinder, findsOneWidget);
  });
}