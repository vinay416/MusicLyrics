import 'package:Music/Controller/TrackDetailsBloc/trackdetails_bloc.dart';
import 'package:Music/ViewModel/trackDetails.ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackDetailsScreen extends StatelessWidget {
  const TrackDetailsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Details"),
        centerTitle: true,
      ),
      body: BlocBuilder<TrackDetailsBloc, TrackdetailsState>(
        builder: (context, state) {
          if (state is Loading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is NoInternet)
            return Center(
              child: Text("No internet connection"),
            );
          else if (state is TrackDetailsLoaded) {
            return TrackDetailsViewModel(
              trackDetailsModel: state.trackDetailsModel,
              lyrics: state.lyrics,
            );
          } else {
            return Center(
              child: Text("Error fetching data"),
            );
          }
        },
      ),
    );
  }
}
