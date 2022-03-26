import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const SizedBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
