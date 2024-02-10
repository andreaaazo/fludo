import 'package:flutter/material.dart';
import 'package:fludo/ui/style/constants.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  State<SwitchButton> createState() => SwitchButtonState();
}

class SwitchButtonState extends State<SwitchButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _selection = false;

  @override
  void initState() {
    super.initState();
    _initAnimationController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// Initializes the animation controller with a duration of 400 milliseconds.
  void _initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener(_handleAnimationStatus);
  }

  /// Handles animation status changes.
  ///
  /// Updates the [_selection] state base on animation status.
  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _selection = true;
    }
    if (status == AnimationStatus.dismissed) {
      _selection = false;
    }
  }

  /// Animates the slider alignment.
  ///
  /// Returns the interpolated alignment value between [Alignment.centerLeft] and [Alignment.centerRight].
  Alignment _sliderAlignmentAnimation() {
    return AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    )
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutCubic,
          ),
        )
        .value;
  }

  /// Animates the slider size.
  ///
  /// Returns the interpolated value between [initSize] and [midSize].
  double _sliderSizeAnimation(
    double initSize,
    double midSize,
  ) {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: initSize, end: midSize),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: midSize, end: initSize),
          weight: 50,
        )
      ],
    )
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutCubic,
          ),
        )
        .value;
  }

  /// Animates the slider color.
  ///
  /// Returns the interpolated color between [UIColors.sliderDefault] and [UIColors.sliderActive].
  Color? _sliderColorAnimation() {
    return TweenSequence(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: UIColors.sliderDefault,
            end: UIColors.sliderActive,
          ),
          weight: 50,
        ),
        TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: UIColors.sliderActive,
            end: UIColors.sliderDefault,
          ),
          weight: 50,
        ),
      ],
    )
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutCubic,
          ),
        )
        .value;
  }

  /// Animates the icon color.
  ///
  /// Returns the interpolated color between [initColor] and [endColor].
  Color? _iconColorAnimation(
    Color? initColor,
    Color? endColor,
  ) {
    return ColorTween(
      begin: initColor,
      end: endColor,
    )
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutCubic,
          ),
        )
        .value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Toggle the animation direction based on the current state.
        _selection ? _controller.reverse() : _controller.forward();
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(500),
          ),
          color: UIColors.trackBg,
        ),
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            Positioned.fill(
                child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) {
                return FractionallySizedBox(
                  heightFactor: _sliderSizeAnimation(1, 0.9),
                  widthFactor: _sliderSizeAnimation(0.5, 0.4),
                  alignment: _sliderAlignmentAnimation(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _sliderColorAnimation(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(500),
                      ),
                    ),
                  ),
                );
              },
            )),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, _) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        color: _iconColorAnimation(
                            UIColors.iconDefault, UIColors.iconDisabled),
                        size: 16,
                        weight: 300,
                        textDirection: TextDirection.ltr,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, _) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: _iconColorAnimation(
                            UIColors.iconDisabled, UIColors.iconDefault),
                        size: 16,
                        weight: 300,
                        textDirection: TextDirection.ltr,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
