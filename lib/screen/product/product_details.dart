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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(' - ',style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
              Text(detailList![index],style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
            ],
          ),
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
          title:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(modelSizeLeading![index]+':',style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
              SizedBox(width: 5,),
              Text(modelSizeList![index],style: GoogleFonts.notoSerif().copyWith(color: Colors.black),),
            ],
          ),
        );
      });
}