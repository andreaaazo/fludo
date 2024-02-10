import 'package:fludo/ui/style/constants.dart';
import 'package:fludo/ui/icon.dart';
import 'package:flutter/material.dart';
import 'package:fludo/ui/text.dart';

/// UIButton is a custom button widget that displays text and an icon.
///
/// It changes its appearance when tapped, providing visual feedback to the user.

class UIButton extends StatefulWidget {
  final String text;
  final IconData icon;

  const UIButton({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  State<UIButton> createState() => _UIButtonState();
}

class _UIButtonState extends State<UIButton> {
  /// Background color of the button.
  Color _background = UIColors.bgPrimaryDefault;

  /// Text color of the button.
  Color _textColor = UIColors.textInvertedWeak;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _handleTap,
      onTapDown: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: _background,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            P100(
              widget.text,
              color: _textColor,
            ),
            UIIcon(
              widget.icon,
              type: 1,
              color: _textColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Handles tap events by updating button appearance.
  void _handleTap(_) {
    setState(() {
      _background = _background == UIColors.bgPrimaryDefault
          ? UIColors.bgPrimaryActive
          : UIColors.bgPrimaryDefault;
      _textColor = _background == UIColors.bgPrimaryDefault
          ? UIColors.textInvertedWeak
          : UIColors.textInvertedDefault;
    });
  }
}
