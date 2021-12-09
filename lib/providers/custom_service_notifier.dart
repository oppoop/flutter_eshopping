import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/utils/permission_request.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

enum ReportType { errorScreen, errorAccount, others }

class CustomServiceNotify extends ChangeNotifier {
  final ReadWriteValue storeList = <String>[].val('ReportImage');
  //final storeList = [].val('imageList');
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String _questionsErrorMsg = '';
  int _photoIndex = 0;
  List<String> _imageList = [];
  bool _questionsValid = false;
  ReportType? _report;

  final List _actionSheet = [
    {"name": S().camera, "icon": Icon(Icons.camera_alt)},
    {"name": S().album, "icon": Icon(Icons.photo)}
  ];

  String get questionsErrorMsg => _questionsErrorMsg;
  List<String> get imageList => _imageList;
  bool get questionsValid => _questionsValid;
  ReportType? get report => _report;

  void questionsValidating({required String fieldValue}) {
    if (fieldValue.length > 10) {
      _questionsValid = true;
      _questionsErrorMsg = '';
    } else {
      _questionsValid = false;
      _questionsErrorMsg = '請最少輸入10個字';
    }
    notifyListeners();
  }

  Future _getImage({required BuildContext context}) async {
    Navigator.of(context).pop();
    ImagePicker picker = ImagePicker();
    if (_photoIndex == 0) {
      await PermissionRequest.askForCamera();
    }
    var image = await picker.getImage(
        source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      _imageList.add(image.path);
      storeList.val = _imageList;
      notifyListeners();
    }
  }

  Future<void> imageLoad() async {
    _imageList = storeList.val;
    notifyListeners();
  }

  void removeImage({required String image}) {
    _imageList.remove(image);
    notifyListeners();
  }

  void chooseImageWay({required BuildContext context, required int i}) {
    _photoIndex = i;
    notifyListeners();
    _getImage(context: context);
  }

  void reportType({required ReportType value}) {
    _report = value;
    notifyListeners();
  }

  Future getActionSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx, i) {
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () => chooseImageWay(context: context, i: i),
                );
              },
            ),
          );
        });
  }
}
