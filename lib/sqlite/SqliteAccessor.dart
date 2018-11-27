import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'TableUser.dart';

class SqliteAccessor {

static const int DB_VERSION = 2;

static final SqliteAccessor _accessor = new SqliteAccessor._internal();

  factory SqliteAccessor() {
    return _accessor;
  }

  SqliteAccessor._internal();

  static final String dbDemo = 'demo.db';

  Future<Database> open() async {

    String dbPath = await getDatabasesPath();
    String aPath = dbPath + dbDemo;
    Database dbase = await openDatabase(aPath, 
        version: DB_VERSION,
        onCreate: (Database db, int version) async {
          print('create db: $version');
          await db.execute(TableUser.SQL_CREATE);
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          print('--->oldVer: $oldVersion  newVersion: $newVersion');
        },
    );
    return dbase;
  }

  Future<UserInfo> query() async {
    Database db = await open();
    List<Map> list = await db.rawQuery('select * from ${TableUser.NAME}');
    print(list);
    db.close();
    return null;
  }

  Future<List<UserInfo>> queryAll() async {
    Database db = await open();

    List<Map> list = await db.rawQuery('select * from ${TableUser.NAME}');

    List<UserInfo> infos = new List();
    list.forEach((Map<dynamic, dynamic> map) {
      var info = new UserInfo(name: map['name'], id: map['id'], age: map['age']);
      infos.add(info);

    });
    return infos;
  }

  void insert(UserInfo user)  async {
    Database db = await open();
    await db.insert(TableUser.NAME, user.toMap());
  }
}