import 'package:encrypt/encrypt.dart';
import 'package:flutter_encryption/util/rsa_key_helper.dart';
import 'package:pointycastle/pointycastle.dart';

class RSAHelper {
  RSAHelper(this.keyPair);

  AsymmetricKeyPair<PublicKey, PrivateKey> keyPair;

  encrypt(String data, RSAKeyHelper _rsaKeyHelper) {
    dynamic publicKey = RSAKeyParser().parse(_rsaKeyHelper
        .encodePublicKeyToPemPKCS1(keyPair.publicKey as RSAPublicKey));

    Encrypter _encrypter = Encrypter(RSA(publicKey: publicKey));

    return _encrypter.encrypt(data).base64;
  }

  decrypt(String encryptedData, RSAKeyHelper _rsaKeyHelper) {
    dynamic privateKey = RSAKeyParser().parse(_rsaKeyHelper
        .encodePrivateKeyToPemPKCS1(keyPair.privateKey as RSAPrivateKey));

    Encrypter _decrypter = Encrypter(RSA(privateKey: privateKey));

    final encrypted = Encrypted.from64(encryptedData);
    return _decrypter.decrypt(encrypted);
  }
}
