import 'package:shared_preferences/shared_preferences.dart';

class DestinationsService {
  static const _keyVisited = "visited";
  static const _keyCount = "visit_count";
  static const _keyName = "destination_name";

  Future<void> saveDestination({
    required bool visited,
    required int count,
    required String name,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyVisited, visited);
    await prefs.setInt(_keyCount, count);
    await prefs.setString(_keyName, name);
  }

  Future<Map<String, dynamic>> loadDestination() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "visited": prefs.getBool(_keyVisited) ?? false,
      "count": prefs.getInt(_keyCount) ?? 0,
      "name": prefs.getString(_keyName) ?? "",
    };
  }
}
