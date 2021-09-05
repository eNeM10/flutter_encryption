# Flutter Encryption
## includes AES, Fernet, Salsa20 and RSA Encryptions

A demo app showing how to implement encryption in your apps.
This project uses [encrypt](https://pub.dev/packages/encrypt) package and [Pointy Castle](https://github.com/PointyCastle/pointycastle) library.

All encryptions and decryptions are handled by [encrypt](https://pub.dev/packages/encrypt) package while the generation of asymmetric keys for RSA is done using the [Pointy Castle](https://github.com/PointyCastle/pointycastle) library.

All the algorithms have their own helper files in the util folder. 

RSA has one extra file:
  rsa_key_helper.dart: To handle generating asymmetric keys for RSA encryption/decryption.
  

