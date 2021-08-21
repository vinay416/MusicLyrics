import 'package:flutter/foundation.dart';

class TrackDetailsModel {
  final String trackName;
  final String trackAlbum;
  final String trackArtist;
  final int explicit;
  final int rating;

  TrackDetailsModel({
    @required this.trackName,
    @required this.trackAlbum,
    @required this.trackArtist,
    @required this.explicit,
    @required this.rating,
  });

  factory TrackDetailsModel.fromJson(Map<String, dynamic> json) {
    return TrackDetailsModel(
      trackName: json["track_name"],
      trackAlbum: json["album_name"],
      trackArtist: json["artist_name"],
      explicit: json["explicit"],
      rating: json["track_rating"],
    );
  }
}
