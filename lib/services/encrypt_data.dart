import 'package:encrypt/encrypt.dart';

class EncryptData {
  static Encrypted? encrypted;
  static var decrypted;

  static String encryptAES(data) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted!.base64;
  }

  static String decryptAES(encryptedData) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedData), iv: iv);
    return decrypted;
  }
}
