import 'dart:io';
import 'package:code4odisha/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final GlobalKey qrKey = GlobalKey();
  QRViewController? controller;
  Barcode? qrCode;
  String? userID = 'u1';

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrCode(context),
            if (qrCode != null)
              QrData.sendQr(qrCode!.code, userID, context).whenComplete(
                () => Navigator.pop(context),
              )
            else
              Positioned(bottom: 20.0, child: buildIdle()),
            Positioned(
              top: 20.0,
              child: buildButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrCode(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: const Color.fromRGBO(239, 91, 12, 1),
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: (MediaQuery.of(context).size.width < 200 ||
                MediaQuery.of(context).size.height < 200)
            ? 150.0
            : 300.0,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.resumeCamera();
    });
    controller.scannedDataStream.listen((Barcode qrCode) {
      setState(() {
        this.qrCode = qrCode;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Widget buildResult() => Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          '${qrCode!.code}',
          maxLines: 5,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );

  Widget buildIdle() => Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Scan QR Code',
          maxLines: 5,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );

  Widget buildButton() => Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) => Icon(
                    snapshot.data == true ? Icons.flash_on : Icons.flash_off),
              ),
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
            ),
            IconButton(
              icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) => Icon(snapshot.data != null
                    ? Icons.camera_front
                    : Icons.camera_rear),
              ),
              onPressed: () async {
                await controller?.flipCamera();
                setState(() {});
              },
            ),
          ],
        ),
      );
}
