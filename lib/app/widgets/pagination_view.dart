import 'package:flutter/material.dart';

class PaginationView extends StatelessWidget {
  final Widget child;
  final VoidCallback onScrollEnd;
  final bool isLoading;
  final bool hasMoreItems;
  const PaginationView({
    super.key,
    required this.child,
    required this.onScrollEnd,
    required this.isLoading,
    required this.hasMoreItems,
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
      child: ListView(
        children: [
          child,
          if (isLoading) ...[
            const SizedBox(height: 10),
            Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
