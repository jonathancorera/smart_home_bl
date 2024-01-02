import 'package:smart_home_bl/model/device_control_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/device.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Device(id INTEGER PRIMARY KEY AUTOINCREMENT, deviceName TEXT NOT NULL, type TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Control(id INTEGER PRIMARY KEY AUTOINCREMENT, status TEXT NOT NULL, timestamp TEXT NOT NULL, deviceId INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<int?> createDevicem(Device item) async {
    final Database db = await initializeDB();
    final id = await db.insert('Device', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Device>> getDevices() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Device');
    return queryResult.map((e) => Device.fromMap(e)).toList();
  }

  Future<int?> createDeviceControlItem(DeviceControlItem item) async {
    final Database db = await initializeDB();
    final id = await db.insert('Control', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<DeviceControlItem>> getDeviceControlItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Control');
    return queryResult.map((e) => DeviceControlItem.fromMap(e)).toList();
  }
}
