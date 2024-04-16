import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'PianoScreen.dart';
import 'PianoKeysWidgets.dart';
import 'package:metronome/metronome.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.title});
  final String title;

  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metronome Settings'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text('Metronome On'),
          ],
        ),
      ),

    );
  }
}


