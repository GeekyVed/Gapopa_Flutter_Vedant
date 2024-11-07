import 'package:flutter/material.dart';

class DockIconCard extends StatelessWidget {
  final dynamic item;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  const DockIconCard({
    super.key,
    required this.item,
    this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 6.0,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24), // Keep rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.iconPath,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12), // Reduced space between icon and text
            Text(
              item.label,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            if (onRemove != null)
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: onRemove,
              ),
            if (onAdd != null)
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: onAdd,
              ),
          ],
        ),
      ),
    );
  }
}
