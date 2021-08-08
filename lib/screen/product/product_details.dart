import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget productDetails({required int detailLength,required List<String>? detailList,}){
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detailLength,
      itemExtent: 40,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(' - ',style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
          title: Text(detailList![index],style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
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
          leading: Text(modelSizeLeading![index]+':',style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
          title: Text(modelSizeList![index],style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
        );
      });
}