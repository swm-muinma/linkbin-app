import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final Image iconImage;
  final String title;
  final Size size;
  final double margin;
  final double padding;
  final List<Widget> children;

  const IconCard({
    super.key,
    required this.title,
    required this.iconImage,
    required this.size,
    required this.children,
    this.margin = 8.0,
    this.padding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenMargin = children.map((child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0), // 원하는 마진 설정
        child: child,
      );
    }).toList();

    return Card(
      margin: EdgeInsets.all(margin),
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            ListTile(
              leading: iconImage,
              title: Text(title),
            ),
            Expanded(
              child: ListView(
                children: childrenMargin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
