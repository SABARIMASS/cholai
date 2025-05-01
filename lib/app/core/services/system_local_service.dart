import 'package:cholai/app/core/helpers/snackbar_helper.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import '../../../shared/themex_colors.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      // ignore: unused_local_variable
      final result = await permission.request();
      return true;
    }
  }

  static Future<String?> _cropImage(String imagePath) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Themex.theme.value.kPrimaryColor,
          toolbarWidgetColor: Themex.theme.value.kAppBackgroundColor,
          activeControlsWidgetColor: Themex.theme.value.kPrimaryColor,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
        WebUiSettings(context: Get.context!),
      ],
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],
      // androidUiSettings: AndroidUiSettings(
      //   toolbarTitle: 'Crop Image',
      //   toolbarColor: Colors.deepOrange,
      //   toolbarWidgetColor: Colors.white,
      //   initAspectRatio: CropAspectRatioPreset.original,
      //   lockAspectRatio: false,
      // ),
      // iosUiSettings: IOSUiSettings(
      //   minimumAspectRatio: 1.0,
      // ),
    );

    if (croppedFile != null) {
      return croppedFile.path;
    }

    return null;
  }

  static Future<File?> _compressFile(File file) async {
    final fileSize = await file.length();
    if (fileSize <= 3 * 1024 * 1024) return file;

    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 88,
    );

    return File(result?.path ?? "");
  }

  static Future<String?> openCamera({bool crop = false}) async {
    final isCameraPermissionGranted = await _requestPermission(
      Permission.camera,
    );

    if (!isCameraPermissionGranted) {
      Get.snackbar('Permission Denied', 'Camera permission is required');
      return null;
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      File? compressedFile = await _compressFile(file);
      if (crop) {
        return await _cropImage(compressedFile?.path ?? file.path);
      }
      return compressedFile?.path ?? file.path;
    }

    return null;
  }

  static Future<String?> openGallerySingle({bool crop = false}) async {
    final isStoragePermissionGranted =
        Platform.isAndroid
            ? await _requestPermission(Permission.photosAddOnly)
            : true;

    if (!isStoragePermissionGranted) {
      SnackbarHelper.showGetXSnackBar(
        title: 'Permission Denied',
        msg: 'Storage permission is required',
      );
      return null;
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      File? compressedFile = await _compressFile(file);
      if (crop) {
        return await _cropImage(compressedFile?.path ?? file.path);
      }
      return compressedFile?.path ?? file.path;
    }

    return null;
  }

  static Future<List<String>?> openGalleryMultiple() async {
    final isStoragePermissionGranted = await _requestPermission(
      Permission.mediaLibrary,
    );

    if (!isStoragePermissionGranted) {
      SnackbarHelper.showGetXSnackBar(
        title: 'Permission Denied',
        msg: 'Storage permission is required',
      );
      return null;
    }

    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      return pickedFiles.map((file) => file.path).toList();
    }

    return null;
  }

  static Future<String?> pickPdf() async {
    final isStoragePermissionGranted = await _requestPermission(
      Permission.storage,
    );

    if (!isStoragePermissionGranted) {
      SnackbarHelper.showGetXSnackBar(
        title: 'Permission Denied',
        msg: 'Storage permission is required',
      );
      return null;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files.single.path;
    }

    return null;
  }

  static Future<String?> pickDoc() async {
    final isStoragePermissionGranted = await _requestPermission(
      Permission.storage,
    );

    if (!isStoragePermissionGranted) {
      SnackbarHelper.showGetXSnackBar(
        title: 'Permission Denied',
        msg: 'Storage permission is required',
      );
      return null;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['doc', 'docx'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files.single.path;
    }

    return null;
  }

  static Future<String?> pickFiles({bool allowMultiple = false}) async {
    final isStoragePermissionGranted = await _requestPermission(
      Permission.storage,
    );

    if (!isStoragePermissionGranted) {
      SnackbarHelper.showGetXSnackBar(
        title: 'Permission Denied',
        msg: 'Storage permission is required',
      );
      return null;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: allowMultiple,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xml', 'xlsx', 'txt'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files.single.path;
    }

    return null;
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
