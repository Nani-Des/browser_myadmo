import 'package:flutter/material.dart';

import 'browser.dart';

class AnimatedSearchIcon extends StatefulWidget {
  final Duration animationDuration;
  final double size;

  const AnimatedSearchIcon({
    Key? key,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.size = 100.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedSearchIconState();
}

class _AnimatedSearchIconState extends State<AnimatedSearchIcon>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.75, end: 2.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Browser(),
                ),
              );
            },
          ),),
      ),
    );
  }
}
