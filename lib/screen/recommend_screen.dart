import 'package:flutter/material.dart';

class RecommendBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('新品'),
        ],
      ),
    );
  }
}
class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend>{

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
