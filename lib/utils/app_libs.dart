import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppLibScreen{
  static Widget appIcon ({
    required IconData icon,
    Color? iconColor,
    double size = 20,
    String iconSize = "medium",
  }) {
    switch (iconSize) {
      case "large":
        size = 30;
        break;
      case "small":
        size = 15;
        break;
      case "medium":
        size = 25;
        break;
      default :
        size = 20;
        break;
    }
    return InkWell(
      onTap: null,
      child: Icon (
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }

  static Widget appText ({
    required String text,
    Color? fontColor,
    String textSize = 'medium',
  }) {
    double fontSize = 18;
    switch(textSize){
      case "large":
        fontSize = 25;
        break;
      case "small":
        fontSize = 13;
        break;
      case "medium":
      default :
        fontSize = 16;
        break;
    }
    return Text(
      "$text",
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }

  static Widget imageContent ({
    required String imageOnePath,
  }) {
    return CachedNetworkImage(
      imageUrl: imageOnePath,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }


}