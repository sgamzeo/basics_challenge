// lib/extensions/extensions.dart

extension StringX on String {
  // checks if the string is a palindrome
  bool get isPalindrome {
    String cleaned = replaceAll(RegExp(r'\W'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }

  // checks if the string contains only letters
  bool get isAlphabetic => RegExp(r'^[a-zA-Z]+$').hasMatch(this);
}

extension IntX on int {
  // checks if the number is prime
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= (this ~/ 2); i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
}

extension DateTimeX on DateTime {
  // returns the number of days between two dates
  int daysUntil(DateTime other) => other.difference(this).inDays.abs();
}

extension BoolX on bool {
  // logical AND operation
  bool and(bool other) => this && other;

  // logical OR operation
  bool or(bool other) => this || other;

  // logical NOT operation
  bool toggle() => !this;
}

extension SetX<T> on Set<T> {
  // removes elements that are also in another set
  Set<T> removeAllFrom(Set<T> other) => difference(other);
}

extension MapX<K, V> on Map<K, V> {
  // returns a list of the map's values
  List<V> get valuesList => values.toList();

  // returns a list of the map's keys
  List<K> get keysList => keys.toList();
}

extension DynamicX on dynamic {
  // checks if the value is null
  bool get isNull => this == null;

  // tries to convert the value to an int
  int? toIntOrNull() {
    if (this == null) return null;
    if (this is int) return this as int;
    if (this is String) return int.tryParse(this as String);
    return null;
  }

  // converts the value to a string
  String? toStrOrNull() => this?.toString();
}
