import 'dart:ui';

extension StringExtension on String {
  /// Capitalizes the first letter of the string and converts the rest to lowercase.
  String get toCapitalize => isNotEmpty
      ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
      : this;

  /// Converts a hex color code string (e.g., "#FF5733") to a [Color] object.
  /// Supports both 6-character and 8-character hex codes.
  Color get toColor {
    final hex = replaceAll("#", "");
    final colorString = hex.length == 6 ? 'FF$hex' : hex;
    return Color(int.parse('0x$colorString'));
  }

  /// Truncates the string to a specified [length].
  /// If the length is greater than the string's length, the entire string is returned.
  String truncate(int length) =>
      this.length > length ? substring(0, length) : this;

  /// Formats the string as a paragraph.
  /// Optionally prepends a dash if [addDash] is true.
  String toParagraph({bool addDash = false}) => '${addDash ? '-' : ''}\t$this';

  /// Converts the string to a boolean value.
  /// Recognizes "true", "1", "false", and "0". Returns [defaultValue] if unrecognized.
  bool toBool({bool defaultValue = false}) {
    switch (toLowerCase()) {
      case '1':
      case 'true':
        return true;
      case '0':
      case 'false':
        return false;
      default:
        return defaultValue;
    }
  }

  /// Converts the string to an integer. Returns [defaultValue] if the conversion fails.
  int? toInt({int? defaultValue}) => int.tryParse(this) ?? defaultValue;

  /// Converts the string to a double. Returns [defaultValue] if the conversion fails.
  double toDouble({double defaultValue = 0.0}) =>
      double.tryParse(this) ?? defaultValue;

  /// Returns `null` if the string is empty, otherwise returns the string itself.
  String? get nullIfEmpty => isEmpty ? null : this;

  /// Removes all whitespace characters from the string.
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Returns true if the string is a valid email address.
  bool get isValidEmail {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(pattern).hasMatch(this);
  }

  /// Returns true if the string is a valid URL.
  bool get isValidUrl {
    const pattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';
    return RegExp(pattern, caseSensitive: false).hasMatch(this);
  }

  /// Returns a string with only numeric characters.
  String get numericOnly => replaceAll(RegExp(r'\D'), '');

  /// Converts the string to title case (capitalizing each word).
  String get toTitleCase =>
      split(' ').map((word) => word.toCapitalize).join(' ');
}