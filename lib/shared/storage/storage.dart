import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class IStorageApp {
  Future<Map<String, dynamic>?> select(String index);
  void put(String index, String value);
  void delete(String index, String value);
  void deleteAll(String index);
}

class StorageApp implements IStorageApp {
  static const String db = 'dictionary_db';

  static Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName))
      Hive.init((await getApplicationDocumentsDirectory()).path);

    return await Hive.openBox(boxName);
  }

  @override
  Future<Map<String, dynamic>?> select(String index) async {
    var box = await openHiveBox(db);
    Map<String, dynamic>? map = await box.get(index);
    return map;
  }

  @override
  put(String index, String value) async {
    var box = await openHiveBox(db);
    var map = await select(index);
    map ??= {};

    box.put(index, {
      ...map,
      ...{value: value}
    });
  }

  @override
  delete(String index, String value) async {
    var box = await openHiveBox(db);

    Map<String, dynamic>? map = await select(index);
    map ??= {};
    map.remove(value);

    box.put(index, map);
  }

  @override
  void deleteAll(String index) async {
    var box = await openHiveBox(db);
    box.delete(index);
  }
}
