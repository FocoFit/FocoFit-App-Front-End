import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class Convert {
  static String _generateSalt([int length = 16]) {
    final random = Random.secure();
    final saltBytes = List<int>.generate(length, (_) => random.nextInt(256));
    return base64Url.encode(saltBytes);
  }

  static String hashPassword(String password, {String? salt}) {
    salt ??= _generateSalt();
    final bytes =
        utf8.encode(password + salt); // convert password + salt to bytes
    final digest = sha256.convert(bytes); // hash using SHA-256
    return '$salt:${digest.toString()}'; // concatenate salt and hash with a separator
  }

  static bool verifyPassword({
    required String inputPassword,
    required String storedHashedPassword,
  }) {
    final parts = storedHashedPassword.split(':');
    if (parts.length != 2) {
      return false; // invalid stored password format
    }
    final salt = parts[0];
    final storedHash = parts[1];
    final hashedInputPassword =
        hashPassword(inputPassword, salt: salt).split(':')[1];
    return hashedInputPassword == storedHash;
  }

  static String convertToIso8601String(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  // Method to calculate age
  static int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

}
