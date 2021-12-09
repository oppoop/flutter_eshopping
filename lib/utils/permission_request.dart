import 'package:permission_handler/permission_handler.dart';

class PermissionRequest {
  // 取得相機權限
  static Future askForCamera() async {
    await Permission.camera.request().then((value) {
      if (value.isGranted) {
      } else {
        openAppSettings();
      }
    }).catchError((error) {
      print('catch cmaera=>$error');
    });
  }

  // 取得麥克風權限
  static Future askForMicrophone() async {
    await Permission.microphone.request().then((value) {
      if (value.isGranted) {
      } else {
        openAppSettings();
      }
    }).catchError((error) {
      print('catch micro=>$error');
    });
  }
}
