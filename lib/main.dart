import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/custom_dialog/credit_card_dialog.dart';
import 'package:flutter_custom_dialog/platform_dialog/platform_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showDialog(BuildContext context) {
    PlatformDialog.show(context);
  }

  void _showCreditCardDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => CreditCardDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Platform Dialog"),
              onPressed: () => _showDialog(context),
            ),
            ElevatedButton(
              child: const Text("Credit Dialog"),
              onPressed: () => _showCreditCardDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
