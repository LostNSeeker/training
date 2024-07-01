import 'package:encrypt/encrypt.dart' as encrypt;


class EncryptionHelper{
  final key = encrypt.Key.fromSecureRandom(32);
  final iv = encrypt.IV.fromSecureRandom(16);


  String encryptText(String text){
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode:encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }


  String decryptText(String encryptText){
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode:encrypt.AESMode.cbc));
    final decrypted = encrypter.decrypt64(encryptText, iv: iv);
    return decrypted;
  }
}
