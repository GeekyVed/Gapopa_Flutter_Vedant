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

  // Override the equality operator to compare items by their 'id' or other fields
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DockItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
