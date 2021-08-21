import 'package:Music/Model/trackDetails.Model.dart';
import 'package:Music/ViewModel/widgets.dart';
import 'package:flutter/material.dart';

class TrackDetailsViewModel extends StatelessWidget {
  final TrackDetailsModel trackDetailsModel;
  final String lyrics;
  const TrackDetailsViewModel({
    Key key,
    @required this.trackDetailsModel,
    @required this.lyrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomText(
            title: 'Name',
            detail: trackDetailsModel.trackName,
          ),
          CustomText(
            title: 'Artist',
            detail: trackDetailsModel.trackArtist,
          ),
          CustomText(
            title: 'Album Name',
            detail: trackDetailsModel.trackAlbum,
          ),
          CustomText(
            title: 'Explicit',
            detail: trackDetailsModel.explicit.toString(),
          ),
          CustomText(
            title: 'Rating',
            detail: trackDetailsModel.rating.toString(),
          ),
          ListTile(
            title: Text(
              'Lyrics',
              style: subtitleBold,
            ),
            subtitle: lyrics == null
                ? Center(child: CircularProgressIndicator())
                : Text(
                    lyrics,
                    style: headingBlack,
                  ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key key,
    @required this.title,
    @required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: subtitleBold,
      ),
      subtitle: Text(
        detail,
        style: headingBlack,
      ),
    );
  }
}
