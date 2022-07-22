import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../config/assets/image_asset.dart';

class GlobalImage extends StatelessWidget {
  final String? url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String placeholder;
  final Size? sizeServer;
  final bool isScale;

  const GlobalImage(
      this.url, {
        Key? key,
        this.sizeServer,
        this.fit,
        this.width,
        this.height,
        this.placeholder = ImageAssets.imgPlaceholder,
        this.isScale = true,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String urlX;
    if (url == null) {
      urlX = 'https://www.kindpng.com/picc/m/20-200041_website-clipart-mobile-friendly-computer-phone-tablet-icon.png';
    } else {
      urlX = url!;
    }

    String imageUrl = isScale
        ? '$urlX?width=${sizeServer?.width.ceil() ?? width?.ceil() ?? ''}&height=${sizeServer?.height.ceil() ?? height?.ceil() ?? ''}'
        : urlX;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Image.asset(
        placeholder,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
      errorWidget: (context, url, error) {
        print('>> GlobalImage error: $error $url');
        print('>> GlobalImage error rul: $imageUrl');
        return FadeInImage.assetNetwork(
          width: width,
          height: height,
          placeholderCacheWidth: width?.ceil(),
          placeholderCacheHeight: height?.ceil(),
          fit: fit,
          placeholderFit: BoxFit.cover,
          placeholder: placeholder,
          imageErrorBuilder: (
              context,
              error,
              stackTrace,
              ) {
            print('>> GlobalImage error: $error $stackTrace');
            print('>> GlobalImage error rul: $imageUrl');
            return Image.asset(
              placeholder,
              fit: BoxFit.cover,
              width: width,
              height: height,
            );
          },
          image: imageUrl,
        );
      },
    );
  }
}
