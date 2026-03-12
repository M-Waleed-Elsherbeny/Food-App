import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveServices {
  static const String favoriteBox = 'favoriteBox';
  static const String favoriteBoxId = 'favoriteBoxId';
  static const String favoriteBoxTitle = 'favoriteBoxTitle';
  static const String favoriteBoxImage = 'favoriteBoxImage';
  static const String favoriteBoxCategory = 'favoriteBoxCategory';
  static const String favoriteBoxArea = 'favoriteBoxArea';
  static const String userBox = 'userBox';
  static const String userBoxName = 'userBoxName';
  static const String userBoxEmail = 'userBoxEmail';
  static Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }
}
