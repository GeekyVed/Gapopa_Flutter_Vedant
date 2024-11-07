import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/dock_item_widget.dart';
import 'package:get/get.dart';

class DockContainer extends StatefulWidget {
  const DockContainer({super.key});

  @override
  State<DockContainer> createState() => _DockContainerState();
}

class _DockContainerState extends State<DockContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final DockController controller = Get.put(DockController());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.items.length; i++)
                    DockItemWidget(
                      key: ValueKey(controller.items[i].id),
                      item: controller.items[i],
                      index: i,
                      onDragStart: (details) {
                        controller.updateDragPosition(
                            i, details.globalPosition);
                        _animationController.forward();
                      },
                      onDragUpdate: (details) {
                        controller.dragOffset.value = details.globalPosition;
                      },
                      onDragEnd: (details) {
                        final newIndex = _calculateNewIndex(details.offset);
                        controller.reorderItem(i, newIndex);
                        _animationController.reverse();
                      },
                      onPressed: controller.items[i].onTap,
                    ),
                ],
              )),
        ),
      ),
    );
  }

  int _calculateNewIndex(Offset offset) {
    // Implementation of index calculation based on drag position
    final RenderBox box = context.findRenderObject() as RenderBox;
    final localOffset = box.globalToLocal(offset);
    return (localOffset.dx ~/ 60).clamp(0, controller.items.length - 1);
  }
}
