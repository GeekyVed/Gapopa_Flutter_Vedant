import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/widgets/dock_item_card.dart';
import 'package:get/get.dart';

class DockIconsSettings extends StatelessWidget {
  final DockController controller = Get.find();

  DockIconsSettings({
    super.key,
  });

  // Function to build the grid view for Dock Icons
  Widget buildDockIconsGrid({
    required List items,
    required Function(int) onItemAction,
    required bool isAddingItems,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 2.6,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return DockIconCard(
          item: item,
          // Either add or remove based on the action
          onRemove: isAddingItems
              ? null
              : () {
                  controller.items.removeAt(index);
                  controller.notAddedItems.add(item);
                },
          onAdd: isAddingItems
              ? () {
                  controller.items.add(item);
                  controller.notAddedItems.removeAt(index);
                }
              : null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final addedItems = controller.items;
    final notAddedItems = controller.notAddedItems;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for Added Icons Section
          Text(
            "Added Icons",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Added Icons Grid
          Obx(() => buildDockIconsGrid(
                items: addedItems,
                onItemAction: (index) {
                  controller.items.removeAt(index);
                },
                isAddingItems: false, // false means we are removing items
              )),

          const SizedBox(height: 20),

          // Title for Not Added Icons Section
          Text(
            "Not Added Icons",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Not Added Icons Grid
          Obx(() => buildDockIconsGrid(
                items: notAddedItems,
                onItemAction: (index) {
                  controller.items.add(notAddedItems[index]);
                },
                isAddingItems: true, // true means we are adding items
              )),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
