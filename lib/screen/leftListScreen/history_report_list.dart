import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryReportList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _topBar(context),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              )),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              '問題回報',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ).paddingOnly(top: 30),
    );
  }
}
