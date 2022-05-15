import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final int count;
  HomeContent({required this.count});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
