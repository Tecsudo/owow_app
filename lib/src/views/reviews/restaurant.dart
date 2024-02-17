import 'dart:developer';

import 'package:feedback/src/core/widget/bg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

import '../../../config/router/route_names.dart';
import '../../core/constants/app_constant.dart';
import '../../core/widget/elevated_button.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  final _formKey = GlobalKey<FormState>();
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: AppConstant.screenSize.width < 640
              ? AppConstant.screenSize.width
              : 640,
          height: AppConstant.screenSize.height,
          child: Form(
            key: _formKey,
            child: Stack(children: [
              Background(screenSize: AppConstant.screenSize),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: AppConstant.screenSize.height * 0.1),
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
                          ElevatedButton(
                              onPressed: () {
                                _qrBarCodeScannerDialogPlugin
                                    .getScannedQrBarCode(
                                        context: context,
                                        onCode: (code) {
                                          setState(() {
                                            this.code = code;
                                            log(code!);
                                          });
                                        });
                              },
                              child: Text(code ?? "Click and hold to scan")),
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

                          context.goNamed(RouteNames.welcome.name);
                        }
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
