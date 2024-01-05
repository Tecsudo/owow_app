import 'dart:developer';
import 'dart:typed_data';

import 'package:feedback/core/widget/bg.dart';
import 'package:feedback/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

import '../../../config/router/route_names.dart';
import '../../../core/widget/elevated_button.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  final _formKey = GlobalKey<FormState>();
  final _restaurantController = TextEditingController();
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width < 640 ? screenSize.width : 640,
          height: screenSize.height,
          child: Form(
            key: _formKey,
            child: Stack(children: [
              Background(screenSize: screenSize),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screenSize.height * 0.1),
                      child: Text(
                        'Enter Restaurant Id',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                    ),
                    SizedBox(
                      width: 313,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: MobileScanner(
                              // fit: BoxFit.contain,
                              controller: cameraController,
                              onDetect: (capture) {
                                final List<Barcode> barcodes = capture.barcodes;
                                final Uint8List? image = capture.image;
                                for (final barcode in barcodes) {
                                  code = barcode.rawValue;
                                  debugPrint(
                                      'Barcode found! ${barcode.rawValue}');
                                }
                              },
                            ),
                          ),
                          IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable:
                                  cameraController.cameraFacingState,
                              builder: (context, state, child) {
                                switch (state as CameraFacing) {
                                  case CameraFacing.front:
                                    return const Icon(Icons.camera_front);
                                  case CameraFacing.back:
                                    return const Icon(Icons.camera_rear);
                                }
                              },
                            ),
                            iconSize: 32.0,
                            onPressed: () => cameraController.switchCamera(),
                          ),
                          Text(code ?? "Click and hold to scan"),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       _qrBarCodeScannerDialogPlugin
                          //           .getScannedQrBarCode(
                          //               context: context,
                          //               onCode: (code) {
                          //                 setState(() {
                          //                   this.code = code;
                          //                   log(code!);
                          //                 });
                          //               });
                          //     },
                          //     child: Text(code ?? "Click and hold to scan")),

                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: const Color(0xFFB7CAA9),
                          //     borderRadius: BorderRadius.circular(5.0),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         left: 15, right: 15, top: 5),
                          //     child: TextFormField(
                          //       controller: _restaurantController,
                          //       style: const TextStyle(
                          //         color: Color(0xFF132513),
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //       decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         hintText: 'R-IS-XXX',
                          //         helperText: 'Restaurant Id',
                          //         // labelText: 'Phone / Email',
                          //         hintStyle: Theme.of(context)
                          //             .textTheme
                          //             .bodyLarge
                          //             ?.copyWith(
                          //               color: const Color(0xFF5E6E59),
                          //             ),
                          //       ),
                          //       validator: (value) {
                          //         if (value == null || value.isEmpty) {
                          //           return 'Please enter Restaurant Id';
                          //         }
                          //         return null;
                          //       },
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    CustomGradientElevatedButton(
                      minimumSize: const Size(313, 60),
                      buttonText: Text(
                        'Continue',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Here you can perform authentication or navigate to another screen
                          // For demo purposes, print the email and password
                          context.goNamed(RouteNames.welcome.name);
                        }
                        // context.goNamed(RouteNames.login.name);
                        // context.goNamed(RouteNames.register.name);
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
