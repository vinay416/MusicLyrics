import 'dart:convert';
import 'package:Music/Model/trackDetails.Model.dart';
import 'package:Music/Model/trending.Model.dart';
import 'package:http/http.dart' as http;

class MusicRepo {
  Future<List<TrendingModel>> trendings() async {
    final response = await http.get(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

    if (response.statusCode == 200) {
      final decoded =
          json.decode(response.body)["message"]["body"]["track_list"];
      final List<TrendingModel> data = (decoded as List)
          .map((e) => TrendingModel.fromJson(e["track"]))
          .toList();

      return data;
    } else {
      throw Exception("Data can't fetch");
    }
  }

  Future<TrackDetailsModel> trackDetails(int trackId) async {
    final response = await http.get(
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body)["message"]["body"]["track"];
      final data = TrackDetailsModel.fromJson(decoded);
      return data;
    } else {
      throw Exception("Data can't fetch");
    }
  }

  Future<String> trackLyrics(int trackId) async {
    final response = await http.get(
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

    if (response.statusCode == 200) {
      final data = json.decode(response.body)["message"]["body"]["lyrics"]
          ["lyrics_body"];

      return data;
    } else {
      throw Exception("Lyrics can't fetch");
    }
  }
}
