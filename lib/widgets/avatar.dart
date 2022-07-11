import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.url,
    required this.radius,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    required this.url,
  })  : radius = 18,
        super(key: key);

  const Avatar.medium({
    Key? key,
    required this.url,
  })  : radius = 26,
        super(key: key);

  const Avatar.large({
    Key? key,
    required this.url,
  })  : radius = 34,
        super(key: key);

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(imageUrl: imageUrl)
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}