import 'package:flutter/material.dart';

class FavouriteAnimationWidget extends StatefulWidget {
  final bool isFavourite;
  final VoidCallback onPressed;

  const FavouriteAnimationWidget({
    super.key,
    required this.isFavourite,
    required this.onPressed,
  });
  @override
  _FavouriteAnimationWidgetState createState() =>
      _FavouriteAnimationWidgetState();
}

class _FavouriteAnimationWidgetState extends State<FavouriteAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 1,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTap() {
    if (!widget.isFavourite) {
      _controller.forward();
    }
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.favorite,
                color: widget.isFavourite ? Colors.red : Colors.grey,
                size: 24,
              ),
            ),
          );
        },
      ),
    );
  }
}
