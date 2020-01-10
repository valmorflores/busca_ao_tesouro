import 'package:flutter/material.dart';

class UnlockLevelCardAnimation extends StatefulWidget {
  final Widget child;

  UnlockLevelCardAnimation({@required this.child}); 

  @override
  _UnlockLevelCardAnimationState createState() => _UnlockLevelCardAnimationState();
}

class _UnlockLevelCardAnimationState extends State<UnlockLevelCardAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
          vsync: this, 
          duration: Duration( seconds: 2 ),
          );
    _animation = Tween( begin:0.0, end:1.0, ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition( opacity: _animation,
        child: widget.child,
    );
  }
}