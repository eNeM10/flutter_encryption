import 'package:flutter/material.dart';
import 'package:flutter_encryption/screens/fernet_demo_screen.dart';
import 'package:flutter_encryption/screens/rsa_demo_screen.dart';
import 'package:flutter_encryption/screens/salsa20_demo_screen.dart';
import 'package:flutter_encryption/util/aes_helper.dart';

class AESDemo extends StatefulWidget {
  const AESDemo({Key? key}) : super(key: key);

  @override
  _AESDemoState createState() => _AESDemoState();
}

class _AESDemoState extends State<AESDemo> {
  TextEditingController _toEncryptController = TextEditingController();
  bool _isLoading = false;
  String encryptedData = '';
  String decryptedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('AES Encryption'),
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
                          encryptedData = AESEncryptionHelper()
                              .encrypt(_toEncryptController.text.trim());
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
                              AESEncryptionHelper().decrypt(encryptedData);
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
                              builder: (context) => RSADemo(),
                            ),
                          );
                        },
                        color: Colors.blue,
                        child: Text(
                          'RSA',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
