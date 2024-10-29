part of 'live_photos.dart';

Future<bool> _generateFromUrl(String videoURL) async {
  final bool status = await LivePhotos._channel.invokeMethod(
    'generateFromURL',
    <String, dynamic>{
      "videoURL": videoURL,
    },
  );
  return status;
}

Future<bool> _generateFromLocalPath(String localPath) async {
  final bool status = await LivePhotos._channel.invokeMethod(
    'generateFromLocalPath',
    <String, dynamic>{
      "localPath": localPath,
    },
  );
  return status;
}
