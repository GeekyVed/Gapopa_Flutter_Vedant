import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/features/dock/presentation/widgets/dock_container.dart';
import 'package:gapopa_flutter_vedant/features/dock/presentation/widgets/dock_settings_panel.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2C3E50),
                  Color(0xFF4CA1AF),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DockContainer(),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.to(() => const DockSettingsPanel()),
                  child: const Text('Settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
