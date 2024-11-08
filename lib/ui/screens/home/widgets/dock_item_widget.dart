import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';

class DockItemWidget extends StatelessWidget {
  final DockItem item;
  final int index;
  final VoidCallback? onPressed;

  const DockItemWidget({
    super.key,
    required this.item,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return _buildIcon();
  }

  Widget _buildIcon({double scale = 1.0}) {
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(item.iconPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
