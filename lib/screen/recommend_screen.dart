import 'package:flutter/material.dart';
import 'package:NMSL/appi_Test/BlockChain_Data/screen.dart';
import 'package:NMSL/appi_Test/tax_data/screen.dart';
import 'package:NMSL/appi_Test/todos_json/screen.dart';

class ReserveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('備用'),
        ],
      ),
    );
  }
}
class Reserve extends StatefulWidget {
  @override
  _Reserve createState() => _Reserve();
}

class _Reserve extends State<Reserve>{
  int _currentIndex = 0;
  final List<Widget> _api = [TaxData(),TodosJson()];
  final List _tittle = ['稅收API','隨意接'];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          itemCount: _api.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('${_tittle[index]}'),
              onTap:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => _api[index]));
              },
            );
          },
        ));
  }
}
