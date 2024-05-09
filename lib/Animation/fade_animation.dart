import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class FadeTranslateAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const FadeTranslateAnimation(this.delay, this.child, {Key? key})
      : super(key: key);

  @override
  _FadeTranslateAnimationState createState() => _FadeTranslateAnimationState();
}

class _FadeTranslateAnimationState extends State<FadeTranslateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(milliseconds: (500 * widget.delay).round()), // Use only once
    );

    _opacityAnimation = 0.0.tweenTo(1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    _translateAnimation = Tween<Offset>(
      begin: Offset(0.0, -0.3), // Adjust the initial translation here
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: _translateAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
