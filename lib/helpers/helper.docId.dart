import 'dart:math';

class StringHelper {
  static String generateDocId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return List.generate(16, (index) => chars[random.nextInt(chars.length)]).join();
  }
}