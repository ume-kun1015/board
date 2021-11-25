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
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                onPressed: AppSettings.openLocationSettings,
                child: const Text('端末の設定へ'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
