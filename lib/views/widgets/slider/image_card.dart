import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/widgets/loading.dart';
import 'package:hotels_exploration/views/widgets/slider/loading_image_error.dart';

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
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            width: 343,
            height: 257,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Loading(),
            errorWidget: (context, url, error) => buildErrorWidget(context),
          ),
        ),
      );

  ///Error Widget
  Container buildErrorWidget(BuildContext context) => Container(
      width: MediaQuery.sizeOf(context).width, child: LoadingImageError());

  ///Border
  RoundedRectangleBorder buildBorder() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      );
}
