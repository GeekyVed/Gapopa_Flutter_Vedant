import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/data/models/all_dock_items.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:get/get.dart';

class DockIconsSettings extends StatelessWidget {
  final DockController controller;

  const DockIconsSettings({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final addedItems = controller.items;
    final notAddedItems =
        allDockItems.where((item) => !addedItems.contains(item)).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for Added Icons Section
          const SizedBox(height: 10),
          Text(
            "Added Icons",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.8),
                ),
          ),
          const SizedBox(height: 10),

          // Added Icons Grid
          Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: addedItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 4 items per row
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final item = addedItems[index];
                  return SizedBox(
                    child: Card(
                      color: Color(0xFFF8F1E5),
                      elevation: 6.0,
                      shadowColor: Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.iconPath,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          IconButton(
                            icon: const Icon(Icons.remove_circle,
                                color: Colors.red),
                            onPressed: () {
                              controller.items.removeAt(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),

          const SizedBox(height: 20),

          // Title for Not Added Icons Section
          Text(
            "Not Added Icons",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.8),
                ),
          ),
          const SizedBox(height: 10),

          // Not Added Icons Grid
          Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notAddedItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 items per row
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final item = notAddedItems[index];
                  return Card(
                    elevation: 6.0,
                    shadowColor: Colors.black.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Logic for tapping the icon (if needed)
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.iconPath,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Colors.green),
                            onPressed: () {
                              controller.items.add(item);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
