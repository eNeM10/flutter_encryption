import 'package:encrypt/encrypt.dart';

class AESEncryptionHelper {

  final _iv = IV.fromLength(16);
  final Encrypter _encrypter = Encrypter(AES(Key.fromLength(32)));

  String encrypt(String data) {
    return _encrypter.encrypt(data, iv: _iv).base64;
  }

  String decrypt(String encryptedData) {
    final encrypted = Encrypted.from64(encryptedData);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }
}
