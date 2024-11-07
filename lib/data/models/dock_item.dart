import 'package:flutter/material.dart';

class DockItem {
  final String id;
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  DockItem({
    required this.id,
    required this.iconPath,
    required this.label,
    this.onTap,
  });
}
