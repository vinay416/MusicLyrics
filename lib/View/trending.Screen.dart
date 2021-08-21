import 'package:Music/Controller/TrendingBloc/trending_bloc.dart';
import 'package:Music/ViewModel/trending.ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending'),
        centerTitle: true,
      ),
      body: BlocBuilder<TrendingBloc, MusicState>(
        builder: (context, state) {
          if (state is Loading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is NoInternet)
            return Center(
              child: Text("No internet connection"),
            );
          else if (state is TrendingLoaded) {
            return ListView.builder(
              itemCount: state.trendings.length,
              itemBuilder: (context, index) => TrendingViewModel(
                trendingModel: state.trendings[index],
              ),
            );
          } else
            return Center(
              child: Text("Error fetching data"),
            );
        },
      ),
    );
  }
}
