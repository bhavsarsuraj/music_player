import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginationView extends StatelessWidget {
  final Widget child;
  final VoidCallback onScrollEnd;
  final bool isLoading;
  final bool hasMoreItems;
  final Future<void> Function()? onRefresh;
  final EdgeInsetsGeometry? padding;
  const PaginationView({
    super.key,
    required this.child,
    required this.onScrollEnd,
    required this.isLoading,
    required this.hasMoreItems,
    this.onRefresh,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (!isLoading &&
            hasMoreItems &&
            notification.metrics.extentAfter < 500) {
          onScrollEnd();
        }
        return true;
      },
      child: onRefresh != null
          ? RefreshIndicator(
              onRefresh: onRefresh!,
              child: _Body(
                child: child,
                isLoading: isLoading,
                padding: padding,
              ),
            )
          : _Body(
              child: child,
              isLoading: isLoading,
              padding: padding,
            ),
    );
  }
}

class _Body extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  const _Body({
    Key? key,
    required this.child,
    required this.isLoading,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      children: [
        child,
        if (isLoading) ...[
          const SizedBox(height: 10),
          Center(
            child: CupertinoActivityIndicator(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              radius: 16,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
