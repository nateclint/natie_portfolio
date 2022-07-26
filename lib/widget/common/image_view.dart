import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String src;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;
  final VoidCallback? onFinish;

  const ImageView(
    this.src, {
    Key? key,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Uri.tryParse(src) == null) return errorWidget ?? Container();
    final img = NetworkImage(src)
      ..resolve(const ImageConfiguration())
          .addListener(ImageStreamListener((_, __) {
        if (onFinish != null) onFinish!();
      }));
    return Image(
      image: img,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        return (progress == null)
            ? child
            : SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                              progress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                ),
              );
      },
      errorBuilder: (context, exception, stackTrace) {
        return errorWidget ?? Container();
      },
    );
  }
}

class CircleImageView extends StatelessWidget {
  final String src;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;
  final VoidCallback? onFinish;

  const CircleImageView(
    this.src, {
    Key? key,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ImageView(
        src,
        errorWidget: errorWidget,
        width: width,
        height: height,
        fit: fit,
        onFinish: onFinish,
      ),
    );
  }
}

class RoundedImageView extends StatelessWidget {
  final String src;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;
  final VoidCallback? onFinish;
  final BorderRadius borderRadius;

  const RoundedImageView(
    this.src, {
    Key? key,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.onFinish,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: ImageView(
        src,
        errorWidget: errorWidget,
        width: width,
        height: height,
        fit: fit,
        onFinish: onFinish,
      ),
    );
  }
}