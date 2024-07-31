import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final alertMsg = 'You are not connected to the internet!';

  late final StreamSubscription<ConnectivityResult> subscription;
  @override
  void onReady() {
    listenNetworkActivity();
    super.onReady();
  }

  void showNoInternetDialog() {
    Get.defaultDialog(
      title: '',
      content: SizedBox(
        width: Get.width - 30,
        child: Column(
          children: [
            const Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
            const SizedBox(
              height: 12,
            ),
            Text(alertMsg)
          ],
        ),
      ),
    );
  }

  void listenNetworkActivity() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        showNoInternetDialog();
      } else {
        if (Get.isDialogOpen!) {
          Get.back();
        }
      }
    });
  }

  Future<bool> get isConnected async => await _checkConnection();

  Future<bool> _checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.ethernet:
        return true;
      case ConnectivityResult.vpn:
        return true;
      case ConnectivityResult.other:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        return false;
    }
  }

  @override
  void onClose() async {
    await subscription.cancel();
    super.onClose();
  }
}
