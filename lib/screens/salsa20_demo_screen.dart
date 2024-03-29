import 'package:flutter/material.dart';
import 'package:flutter_encryption/screens/aes_demo_screen.dart';
import 'package:flutter_encryption/screens/fernet_demo_screen.dart';
import 'package:flutter_encryption/screens/rsa_demo_screen.dart';
import 'package:flutter_encryption/util/salsa20_helper.dart';

class Salsa20Demo extends StatefulWidget {
  const Salsa20Demo({Key? key}) : super(key: key);

  @override
  _Salsa20DemoState createState() => _Salsa20DemoState();
}

class _Salsa20DemoState extends State<Salsa20Demo> {
  TextEditingController _toEncryptController = TextEditingController();
  bool _isLoading = false;
  String encryptedData = '';
  String decryptedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Salsa20 Encryption'),
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
                          encryptedData = Salsa20Helper()
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
                              Salsa20Helper().decrypt(encryptedData);
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
