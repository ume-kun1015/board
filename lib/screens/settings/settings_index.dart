import 'package:flutter/material.dart';

class SettingsIndexScreen extends StatelessWidget {
  const SettingsIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('settings screen'),
          ],
        ),
      ),
    );
  }
}
