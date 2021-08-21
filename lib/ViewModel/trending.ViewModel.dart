import 'package:Music/Controller/NetworkBloc/network_bloc.dart';
import 'package:Music/Controller/TrackDetailsBloc/trackdetails_bloc.dart';
import 'package:Music/Model/trending.Model.dart';
import 'package:Music/View/trackDetails.Screen.dart';
import 'package:Music/ViewModel/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingViewModel extends StatelessWidget {
  final TrendingModel trendingModel;
  const TrendingViewModel({
    Key key,
    @required this.trendingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider<TrackDetailsBloc>(
            create: (context) => TrackDetailsBloc(
              networkBloc: context.read<NetworkBloc>(),
              trackId: trendingModel.trackId,
            )..add(Connected()),
            child: TrackDetailsScreen(),
          ),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.library_music_sharp),
            title: Text(
              trendingModel.trackName,
              style: heading,
            ),
            subtitle: Text(
              trendingModel.trackAlbum,
              style: subtitle,
            ),
            trailing: Container(
              width: 100,
              child: Text(
                trendingModel.trackArtists,
                style: subtitle,
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
