class StringUtil {
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static bool isNullOrEmpty(String? text) {
    return text == null || text.trim().isEmpty;
  }
}
