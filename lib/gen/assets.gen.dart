/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/amplop_icon.svg
  SvgGenImage get amplopIcon =>
      const SvgGenImage('assets/icons/amplop_icon.svg');

  /// File path: assets/icons/button_down_active_icon.svg
  SvgGenImage get buttonDownActiveIcon =>
      const SvgGenImage('assets/icons/button_down_active_icon.svg');

  /// File path: assets/icons/button_down_icon.svg
  SvgGenImage get buttonDownIcon =>
      const SvgGenImage('assets/icons/button_down_icon.svg');

  /// File path: assets/icons/button_up_active_icon.svg
  SvgGenImage get buttonUpActiveIcon =>
      const SvgGenImage('assets/icons/button_up_active_icon.svg');

  /// File path: assets/icons/date_icon.svg
  SvgGenImage get dateIcon => const SvgGenImage('assets/icons/date_icon.svg');

  /// File path: assets/icons/destination_icon.svg
  SvgGenImage get destinationIcon =>
      const SvgGenImage('assets/icons/destination_icon.svg');

  /// File path: assets/icons/down_stroke_icon.svg
  SvgGenImage get downStrokeIcon =>
      const SvgGenImage('assets/icons/down_stroke_icon.svg');

  /// File path: assets/icons/facebook_icon.svg
  SvgGenImage get facebookIcon =>
      const SvgGenImage('assets/icons/facebook_icon.svg');

  /// File path: assets/icons/google_icon.svg
  SvgGenImage get googleIcon =>
      const SvgGenImage('assets/icons/google_icon.svg');

  /// File path: assets/icons/heart_icon.svg
  SvgGenImage get heartIcon => const SvgGenImage('assets/icons/heart_icon.svg');

  /// File path: assets/icons/home_icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/icons/home_icon.svg');

  /// File path: assets/icons/home_inactive_icon.svg
  SvgGenImage get homeInactiveIcon =>
      const SvgGenImage('assets/icons/home_inactive_icon.svg');

  /// File path: assets/icons/location_icon.svg
  SvgGenImage get locationIcon =>
      const SvgGenImage('assets/icons/location_icon.svg');

  /// File path: assets/icons/password_hide.svg
  SvgGenImage get passwordHide =>
      const SvgGenImage('assets/icons/password_hide.svg');

  /// File path: assets/icons/password_show.svg
  SvgGenImage get passwordShow =>
      const SvgGenImage('assets/icons/password_show.svg');

  /// File path: assets/icons/person_icon.svg
  SvgGenImage get personIcon =>
      const SvgGenImage('assets/icons/person_icon.svg');

  /// File path: assets/icons/person_inactive_icon.svg
  SvgGenImage get personInactiveIcon =>
      const SvgGenImage('assets/icons/person_inactive_icon.svg');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner_home.png
  AssetGenImage get bannerHome =>
      const AssetGenImage('assets/images/banner_home.png');

  /// File path: assets/images/login_banner.png
  AssetGenImage get loginBanner =>
      const AssetGenImage('assets/images/login_banner.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
