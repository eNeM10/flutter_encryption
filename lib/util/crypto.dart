import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class AESEncryptionHelper {
  final Encrypter _encrypter = Encrypter(AES(Key.fromLength(32)));

  final _iv = IV.fromLength(16);

  String encrypt(String data) {
    return _encrypter.encrypt(data, iv: _iv).base64;
  }

  String decrypt(String encryptedData) {
    final encrypted = Encrypted.from64(encryptedData);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }
}

class Salsa20Helper {
  final _encrypter = Encrypter(Salsa20(Key.fromLength(64)));

  //Salsa20 uses exactly 8 bytes IV so don't change this
  final _iv = IV.fromLength(8);

  String encrypt(String data) {
    return _encrypter.encrypt(data, iv: _iv).base64;
  }

  String decrypt(String encryptedData) {
    final encrypted = Encrypted.from64(encryptedData);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }
}

class FernetHelper {
  final _encrypter = Encrypter(Fernet(Key.fromLength(32)));

  String encrypt(String data) {
    return _encrypter.encrypt(data).base64;
  }

  String decrypt(String encryptedData) {
    final encrypted = Encrypted.from64(encryptedData);
    return _encrypter.decrypt(encrypted);
  }
}
