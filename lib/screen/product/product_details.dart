import 'package:flutter/material.dart';

Widget productDetails({required int detailLength,required List<String>? detailList,}){
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detailLength,
      itemExtent: 40,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(' - '),
          title: Text(detailList![index]),
        );
      });
}

Widget productModelSize({required int modelSizeLength,required List<String>? modelSizeLeading,required List<String>? modelSizeList,}){
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: modelSizeLength,
      itemExtent: 40,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(modelSizeLeading![index]+':'),
          title: Text(modelSizeList![index]),
        );
      });
}