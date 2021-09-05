import 'package:encrypt/encrypt.dart';

class Salsa20Helper {
  final _encrypter = Encrypter(Salsa20(Key.fromLength(64)));

  final _iv = IV.fromLength(8);

  String encrypt(String data) {
    return _encrypter.encrypt(data, iv: _iv).base64;
  }

  String decrypt(String encryptedData) {
    final encrypted = Encrypted.from64(encryptedData);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }
}
