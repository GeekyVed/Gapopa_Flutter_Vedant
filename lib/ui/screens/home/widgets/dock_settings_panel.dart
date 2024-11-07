import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:get/get.dart';

class DockSettingsPanel extends StatelessWidget {
  const DockSettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final DockController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dock Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => SizedBox(
                  width: 400,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return ListTile(
                        leading: Image.asset(
                          item.iconPath,
                          width: 32,
                          height: 32,
                        ),
                        title: Text(item.label),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            controller.items.removeAt(index);
                          },
                        ),
                      );
                    },
                  ),
                )),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.items.add(
                  DockItem(
                    id: 'new_item',
                    iconPath: 'assets/icons/new_app.png',
                    label: 'New App',
                    onTap: () => log('New app launched'),
                  ),
                );
              },
              child: const Text('Add New App'),
            ),
          ],
        ),
      ),
    );
  }
}
