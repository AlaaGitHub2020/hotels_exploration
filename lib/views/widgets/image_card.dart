import 'package:flutter/material.dart';

///Image Card
class ImageCard extends StatelessWidget {
  ///Constructor
  const ImageCard({required this.url, super.key});

  ///image Url
  final String url;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.zero,
        shape: buildBorder(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: 343,
            height: 257,
          ),
        ),
      );

  ///Border
  RoundedRectangleBorder buildBorder() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      );
}
