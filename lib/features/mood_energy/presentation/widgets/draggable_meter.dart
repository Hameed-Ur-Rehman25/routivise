import 'package:flutter/material.dart';

class DraggableMeter extends StatefulWidget {
  final List<Color> gradientColors;
  final List<Widget> iconWidgets;
  final double height;
  final Function(double) onValueChanged;
  final double initialValue; // 0.0 to 1.0 range
  final Widget Function(double value)
  handleBuilder; // New: builder for the draggable handle

  const DraggableMeter({
    super.key,
    required this.gradientColors,
    required this.iconWidgets,
    this.height = 20,
    required this.onValueChanged,
    this.initialValue = 0.5,
    required this.handleBuilder,
  });

  @override
  State<DraggableMeter> createState() => _DraggableMeterState();
}

class _DraggableMeterState extends State<DraggableMeter> {
  late double _dragValue; // 0.0 to 1.0 normalized value
  final GlobalKey _sliderKey = GlobalKey();
  double? _dragStartValue;
  double? _dragStartDx;

  @override
  void initState() {
    super.initState();
    _dragValue = widget.initialValue;
  }

  void _updateDragValue(
    Offset globalPosition,
    double handleSize,
    double maxWidth,
  ) {
    final RenderBox box =
        _sliderKey.currentContext!.findRenderObject() as RenderBox;
    final localOffset = box.globalToLocal(globalPosition);
    double newValue =
        (localOffset.dx - handleSize / 2) / (maxWidth - handleSize);
    newValue = newValue.clamp(0.0, 1.0);
    setState(() {
      _dragValue = newValue;
    });
    widget.onValueChanged(_dragValue);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double handleSize = 40;
        double handleX = (_dragValue * (maxWidth - handleSize));
        return Stack(
          clipBehavior: Clip.none,
          children: [
            // Slider background with tap support
            GestureDetector(
              key: _sliderKey,
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) {
                _updateDragValue(details.globalPosition, handleSize, maxWidth);
              },
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.gradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Draggable handle (emoji with pointer)
            Positioned(
              left: handleX,
              top:
                  (widget.height - handleSize) /
                  2.0, // Centering the handle vertically
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (details) {
                  _dragStartDx = details.globalPosition.dx;
                  _dragStartValue = _dragValue;
                },
                onPanUpdate: (details) {
                  if (_dragStartDx == null || _dragStartValue == null) return;
                  final RenderBox box =
                      _sliderKey.currentContext!.findRenderObject()
                          as RenderBox;
                  final localOffset = box.globalToLocal(
                    Offset(
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                    ),
                  );
                  double newValue =
                      (localOffset.dx - handleSize / 2) /
                      (maxWidth - handleSize);
                  newValue = newValue.clamp(0.0, 1.0);
                  setState(() {
                    _dragValue = newValue;
                  });
                  widget.onValueChanged(_dragValue);
                },
                onPanEnd: (_) {
                  _dragStartDx = null;
                  _dragStartValue = null;
                },
                child: widget.handleBuilder(_dragValue),
              ),
            ),
            // Static icons (left and right only)
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: maxWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [widget.iconWidgets.first, widget.iconWidgets.last],
              ),
            ),
          ],
        );
      },
    );
  }
}
