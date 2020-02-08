import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App Clickme',
      home: QRapp()
    );
  }
}

class QRapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppState();
  
  }

class _MyAppState extends State<QRapp> {
  GlobalKey qrKey  = GlobalKey();
  var qrText = "";
  QRViewController controller;
  @override
  Widget build(BuildContext context) {  
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(key: qrKey, 
            overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderColor: Colors.red,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300),
            onQRViewCreated: _onQRViewCreate),
      ),
      Expanded(
        flex: 1,
        child: Center (
          child: Text('Scanear resultado: $qrText'),
         ),
        )
      ],
    ),
  );
  }


@override
void dispose() {
  controller?.dispose();
  super.dispose();
}

void _onQRViewCreate(QRViewController controller){
  this.controller = controller;
  controller.scannedDataStream.listen((ScanData){
    setState(() { 
      qrText = ScanData;
    });
    });
  }
}
