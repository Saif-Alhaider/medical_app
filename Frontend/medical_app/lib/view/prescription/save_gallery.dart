import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

Future<Uint8List?> capturePng(
    {required key, String? imagePath, File? capturedFile}) async {
  try {
    bool inside = true;
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = (await boundary.toImage(pixelRatio: 3.0));
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    final String dir = (await getApplicationDocumentsDirectory()).path;
    imagePath = '$dir/QrPrescription${DateTime.now()}.png';
    capturedFile = File(imagePath);
    await capturedFile.writeAsBytes(pngBytes);
    print(capturedFile.path);
    final result = await ImageGallerySaver.saveImage(pngBytes,
        quality: 60, name: "QrPrescription${DateTime.now()}");
    print('png done');
    return pngBytes;
  } catch (e) {
    print(e);
  }
}
