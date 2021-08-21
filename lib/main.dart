import 'package:Music/Controller/TrendingBloc/trending_bloc.dart';
import 'package:Music/Controller/NetworkBloc/network_bloc.dart';
import 'package:Music/View/trending.Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkBloc>(
      create: (context) => NetworkBloc(),
      child: MaterialApp(
        home: BlocProvider<TrendingBloc>(
          create: (context) => TrendingBloc(context.read<NetworkBloc>()),
          child: TrendingScreen(),
        ),
      ),
    );
  }
}
