import 'package:flutter/material.dart';
import 'package:natie_portfolio/global/vars.dart';
import 'package:natie_portfolio/store/animation_store.dart';

class FadeSlideAnimation extends ImplicitlyAnimatedWidget {
  const FadeSlideAnimation({
    Key? key,
    this.child,
    required this.offset,
    required this.opacity,
    Duration duration = Vars.animationFast,
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  })  : assert(opacity >= 0.0 && opacity <= 1.0),
        super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  final Widget? child;
  final Offset offset;
  final double opacity;

  @override
  ImplicitlyAnimatedWidgetState<FadeSlideAnimation> createState() =>
      _FadeSlideAnimationState();
}

class _FadeSlideAnimationState
    extends ImplicitlyAnimatedWidgetState<FadeSlideAnimation> {
  late Offset _offset;
  late double _opacity;

  Tween<Offset>? _offsetTween;
  late Animation<Offset> _offsetAnimation;
  Tween<double>? _opacityTween;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _offset = widget.offset;
    _opacity = widget.opacity;
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _offsetTween = visitor(_offsetTween, _offset,
        (value) => Tween<Offset>(begin: value as Offset)) as Tween<Offset>?;
    _opacityTween = visitor(_opacityTween, _opacity,
        (value) => Tween<double>(begin: value as double)) as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _offsetAnimation = animation.drive(_offsetTween!);
    _opacityAnimation = animation.drive(_opacityTween!);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      ),
    );
  }
}

class AnimatedHover extends StatefulWidget {
  final Widget child;
  final double scaleOnHover;
  final Duration duration;
  final VoidCallback? onPressed;
  final bool feedback;

  const AnimatedHover({
    Key? key,
    required this.child,
    required this.scaleOnHover,
    required this.duration,
    this.onPressed,
    this.feedback = true,
  }) : super(key: key);

  @override
  State<AnimatedHover> createState() => _AnimatedHoverState();
}

class _AnimatedHoverState extends State<AnimatedHover> {
  late double _scaleOnHover;
  late VoidCallback? _onPressed;
  late bool _feedback;

  final AnimationStore _ani = AnimationStore();

  @override
  void initState() {
    super.initState();
    _scaleOnHover = widget.scaleOnHover;
    _onPressed = widget.onPressed;
    _feedback = widget.feedback;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed ?? (_feedback ? () {} : null),
      mouseCursor:
          _feedback && _onPressed == null ? MouseCursor.uncontrolled : null,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onHover: (isHover) {
        if (!_feedback) return;
        if (isHover) {
          _ani.start();
        } else {
          _ani.stop();
        }
      },
      child: AnimatedScale(
        scale: _ani.willStart ? _scaleOnHover : 1,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}