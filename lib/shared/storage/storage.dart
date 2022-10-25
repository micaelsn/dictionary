import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class IStorageApp {
  Future<dynamic> select(String index);
  void add(dynamic value);
  void put(String index, dynamic value);
  void delete(String index);
  void deleteAll();
}

class StorageApp implements IStorageApp {
  static const String db = 'dictionary_db';

  static Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName))
      Hive.init((await getApplicationDocumentsDirectory()).path);

    return await Hive.openBox(boxName);
  }

  @override
  Future<dynamic> select(String index) async {
    var box = await openHiveBox(db);
// var list = box.get(index);
    return box.get(index);
  }

  @override
  Future<List> selectAll() async {
    var box = await openHiveBox(db);

    return box.values.toList();
  }

  @override
  put(String index, dynamic value) async {
    var box = await openHiveBox(db);
    var list = await select(index);

    list = list != null ? (list as List) : [];

    box.put(index, [...list, value]);
  }

  @override
  add(dynamic value) async {
    var box = await openHiveBox(db);
    box.add(value);
  }

  @override
  delete(String index) async {
    var box = await openHiveBox(db);
    box.delete(index);
  }

  @override
  void deleteAll() async {
    var box = await openHiveBox(db);
    box.deleteFromDisk();
  }
}
