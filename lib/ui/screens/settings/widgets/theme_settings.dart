import 'package:flutter/material.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Default Theme Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Theme toggle example (you can extend it)
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: false,
          onChanged: (bool value) {},
        ),
      ],
    );
  }
}
