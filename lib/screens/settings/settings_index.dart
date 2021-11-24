import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

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
            ElevatedButton(
              onPressed: AppSettings.openLocationSettings,
              child: Text('OSの設定へ'),
            ),
          ],
        ),
      ),
    );
  }
}
