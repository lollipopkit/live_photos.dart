import 'dart:async';

import 'package:flutter/services.dart';

part 'impl.dart';

/// The main class of this library.
abstract final class LivePhotos {
  /// Method Channel for the native code.
  static const MethodChannel _channel = const MethodChannel('live_photos');

  /// Only accept urls that start with `http://` or `https://`.
  static final _urlReg = RegExp(r'^https?://');

  /// Generates a live photo from a http(s) url or path.
  /// eg.: `https://example.com/video.mp4` or `/path/to/video.mp4`
  static Future<bool> generate(String url) {
    final isFilePath = url.startsWith('/');
    if (isFilePath) {
      return _generateFromLocalPath(url);
    } else if (url.startsWith(_urlReg)) {
      return _generateFromUrl(url);
    }
    return Future.value(false);
  }

  /// Opens the settings of the app.
  static Future<bool> openSettings() async {
    final bool status = await _channel.invokeMethod('openSettings');
    return status;
  }
}
