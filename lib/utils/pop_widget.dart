import 'image_viwer_local.dart';
import 'package:flutter/material.dart';
import 'image_viwer_online.dart';
import 'image_viwer_assets.dart';

class popWidget {
  static Future<void> imageViewerDialog({
    required BuildContext context,
    required String path,
  }) {
    print(path);
    return showDialog(
      context: context,
      builder: (context) => ImageViewerOnline(imagePath: path,),
    );
  }

  static Future<void> imageFileDialog({
    required BuildContext context,
    required String img,
  }) {
    print(img);
    return showDialog(
      context: context,
      builder: (context) => ImageViewerLocal(imaglocal: img,),
    );
  }

  static Future<void> imageAssetsDialog({
    required BuildContext context,
    required String img,
  }) {
    print(img);
    return showDialog(
      context: context,
      builder: (context) => ImageViewerAssets(imaglocal: img,),
    );
  }

}