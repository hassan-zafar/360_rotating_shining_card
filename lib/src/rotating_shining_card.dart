import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A widget representing a freely rotating card with a shining effect.
class RotatingShiningCard extends StatefulWidget {
  /// The front widget of the card (e.g., an image or any custom widget).
  final Widget frontChild;

  /// The back widget of the card.
  final Widget backChild;

  /// The dimensions of the card.
  final double width, height;

  /// The border radius of the card.
  final double borderRadius;

  /// The intensity of the shine effect.
  final double shineIntensity;

  /// The color of the shine effect.
  final Color shineColor;

  const RotatingShiningCard({
    Key? key,
    required this.frontChild,
    required this.backChild,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
    this.shineIntensity = 0.5,
    this.shineColor = Colors.white,
  }) : super(key: key);

  @override
  RotatingShiningCardState createState() => RotatingShiningCardState();
}

class RotatingShiningCardState extends State<RotatingShiningCard> {
  double rotationY = 0.0;
  double rotationX = 0.0;
  Offset shineOffset = Offset.zero;

  void onTouchMove(Offset localPosition) {
    final size = context.size ?? Size.zero;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    setState(() {
      rotationX = ((localPosition.dy - centerY) / centerY) * math.pi / 8;
      rotationY = -((localPosition.dx - centerX) / centerX) * math.pi / 8;
      shineOffset = localPosition;
    });
  }

  void onTouchEnd() {
    setState(() {
      rotationX = 0.0;
      rotationY = 0.0;
      shineOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isBackVisible = rotationY.abs() > math.pi / 4;

    return GestureDetector(
      onPanUpdate: (details) => onTouchMove(details.localPosition),
      onPanEnd: (_) => onTouchEnd(),
      onPanCancel: () => onTouchEnd(),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateX(rotationX)
            ..rotateY(rotationY),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Back face
              if (isBackVisible)
                _buildCardFace(
                  child: widget.backChild,
                  rotateY: math.pi,
                ),
              // Front face
              if (!isBackVisible)
                _buildCardFace(
                  child: widget.frontChild,
                ),
              // Shine effect
              if (shineOffset != Offset.zero) _buildShineEffect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardFace({required Widget child, double rotateY = 0.0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(rotateY),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: child,
        ),
      ),
    );
  }

  Widget _buildShineEffect() {
    final size = context.size ?? Size.zero;
    return Positioned(
      left: shineOffset.dx - size.width,
      top: shineOffset.dy - size.height,
      child: IgnorePointer(
        child: Container(
          width: size.width * 2,
          height: size.height * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                widget.shineColor.withOpacity(widget.shineIntensity),
                Colors.transparent,
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
