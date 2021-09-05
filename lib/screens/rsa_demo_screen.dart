import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_encryption/screens/aes_demo_screen.dart';
import 'package:flutter_encryption/screens/fernet_demo_screen.dart';
import 'package:flutter_encryption/screens/salsa20_demo_screen.dart';
import 'package:flutter_encryption/util/rsa_helper.dart';
import 'package:flutter_encryption/util/rsa_key_helper.dart';
import 'package:pointycastle/api.dart' as crypto;
import 'package:pointycastle/asymmetric/api.dart';

class RSADemo extends StatefulWidget {
  const RSADemo({Key? key}) : super(key: key);

  @override
  _RSADemoState createState() => _RSADemoState();
}

class _RSADemoState extends State<RSADemo> {
  TextEditingController _toEncryptController = TextEditingController();
  bool _isLoading = false;

  String encryptedData = '';
  String decryptedData = '';

  RSAKeyHelper _rsaKeyHelper = RSAKeyHelper();

  late RSAHelper _rsaHelper;

  late crypto.AsymmetricKeyPair keyPair;

  Future<void> getKeyPair() async {
    setState(() {
      _isLoading = true;
    });

    keyPair = await _rsaKeyHelper.computeRSAKeyPair(
      _rsaKeyHelper.getSecureRandom(),
    );

    _rsaHelper = RSAHelper(keyPair);

    setState(() {
      _isLoading = false;
    });

    return;
  }

  @override
  void initState() {
    getKeyPair();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('RSA Encryption'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32.0,
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Container(
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Container(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Data: ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: _toEncryptController,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_toEncryptController.text.trim() == '') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('Enter text to encrypt!'),
                            ),
                          );
                        } else {
                          encryptedData = _rsaHelper.encrypt(
                              _toEncryptController.text.trim(), _rsaKeyHelper);
                          setState(() {});
                        }
                      },
                      child: Text('Encypt'),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Encrypted Data: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          encryptedData,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        if (encryptedData == '') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('No text to decrypt!'),
                            ),
                          );
                        } else {
                          decryptedData =
                              _rsaHelper.decrypt(encryptedData, _rsaKeyHelper);
                          setState(() {});
                        }
                      },
                      child: Text('Decrypt'),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Decrypted Data: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          decryptedData,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AESDemo(),
                            ),
                          );
                        },
                        color: Colors.blue,
                        child: Text(
                          'AES',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => FernetDemo(),
                            ),
                          );
                        },
                        color: Colors.blue,
                        child: Text(
                          'Fernet',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Salsa20Demo(),
                            ),
                          );
                        },
                        color: Colors.blue,
                        child: Text(
                          'Salsa20',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
