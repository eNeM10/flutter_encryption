# Flutter Encryption
## includes AES, Fernet, Salsa20 and RSA Encryptions

A demo app showing how to implement encryption in your apps.
This project uses [encrypt](https://pub.dev/packages/encrypt) package and [Pointy Castle](https://github.com/PointyCastle/pointycastle) library.

All encryptions and decryptions are handled by [encrypt](https://pub.dev/packages/encrypt) package while the generation of asymmetric keys for RSA is done using the [Pointy Castle](https://github.com/PointyCastle/pointycastle) library.

All the algorithms have their own helper files in the util folder. 

RSA has one extra file:
  rsa_key_helper.dart: To handle generating asymmetric keys for RSA encryption/decryption.
  
  ![image](https://user-images.githubusercontent.com/51107081/132126305-44045507-85b2-4f22-9c69-90167f8ac5bd.png)

  ![image](https://user-images.githubusercontent.com/51107081/132126332-e96198d4-3275-4a7b-8e5f-d808b89afbab.png)

