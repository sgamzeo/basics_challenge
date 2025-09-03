// decryption_service.dart
import 'dart:async';
import 'package:flutter/material.dart';

class DecryptionService {
  static final DecryptionService _instance = DecryptionService._internal();
  factory DecryptionService() => _instance;
  DecryptionService._internal();

  // acts like NotificationCenter
  final ValueNotifier<String?> decryptedMessage = ValueNotifier(null);

  void decryptMessage(String code) {
    // reset old message
    decryptedMessage.value = null;

    // simulate 15-second decryption
    Timer(const Duration(seconds: 15), () {
      // set the decrypted message
      decryptedMessage.value = "secret message decoded with code: $code";
    });
  }
}
