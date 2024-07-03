import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcodegen/pages/generate_page.dart';

class ScanCodePage extends StatefulWidget {
  const ScanCodePage({super.key});

  @override
  State<ScanCodePage> createState() => _ScanCodePageState();
}

class _ScanCodePageState extends State<ScanCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Page"),
        actions: [
          IconButton(onPressed: (){
            Navigator.popAndPushNamed(context, "/generate");
          }, icon: Icon(Icons.qr_code))
        ],
      ),
      body: MobileScanner(
              controller: MobileScannerController(detectionSpeed: DetectionSpeed.normal,
              returnImage: true),
              
              onDetect: (capture) {
        final List <Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        for (final barcode in barcodes){
          print("barcodes found ${barcode.rawValue}", );



        }

        if (image != null) {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text(barcodes.first.rawValue ?? "",),
              content: Image(image: MemoryImage(image)),
            );
          });
        }
      },
)
    );
  }
}
