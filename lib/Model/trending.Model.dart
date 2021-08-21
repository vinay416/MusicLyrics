import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TrendingModel {
  final int trackId;
  final String trackName;
  final String trackAlbum;
  final String trackArtists;

  TrendingModel({
    @required this.trackId,
    @required this.trackName,
    @required this.trackAlbum,
    @required this.trackArtists,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> response) {
    return TrendingModel(
      trackId: response["track_id"],
      trackName: response["track_name"],
      trackAlbum: response["album_name"],
      trackArtists: response["artist_name"],
    );
  }
}
