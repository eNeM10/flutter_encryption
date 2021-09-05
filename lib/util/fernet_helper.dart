import 'package:encrypt/encrypt.dart';

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
