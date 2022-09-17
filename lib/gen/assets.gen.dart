/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_calendar.png
  AssetGenImage get icCalendar =>
      const AssetGenImage('assets/images/ic_calendar.png');

  /// File path: assets/images/ic_copy.png
  AssetGenImage get icCopy => const AssetGenImage('assets/images/ic_copy.png');

  /// File path: assets/images/ic_plus.png
  AssetGenImage get icPlus => const AssetGenImage('assets/images/ic_plus.png');

  /// File path: assets/images/im_helper.png
  AssetGenImage get imHelper =>
      const AssetGenImage('assets/images/im_helper.png');

  /// File path: assets/images/im_job.png
  AssetGenImage get imJob => const AssetGenImage('assets/images/im_job.png');

  /// File path: assets/images/im_ok.png
  AssetGenImage get imOk => const AssetGenImage('assets/images/im_ok.png');

  /// File path: assets/images/im_people.png
  AssetGenImage get imPeople =>
      const AssetGenImage('assets/images/im_people.png');

  /// File path: assets/images/im_photo.png
  AssetGenImage get imPhoto =>
      const AssetGenImage('assets/images/im_photo.png');
}

class $AssetsMapsGen {
  const $AssetsMapsGen();

  /// File path: assets/maps/style.json
  String get style => 'assets/maps/style.json';
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMapsGen maps = $AssetsMapsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
