
import 'package:bored_flutter_app/data/local/entity/activity_entity.dart';
import 'package:sqflite/sqflite.dart';

class LocalActivityService {
  LocalActivityService(this.db);
  Database db;

  Future<List<ActivityEntity>> getAllLikedActivities() async {
    List<Map> maps = await db.query(ActivityEntity.tableName, orderBy: ActivityEntity.columnId + " DESC");
    return ActivityEntity.fromMapList(maps);
  }

  Future<List<ActivityEntity>> getLikedActivitiesByKey(int key) async {
    List<Map> maps = await db.query(ActivityEntity.tableName, orderBy: ActivityEntity.columnId + " DESC",
      where: "${ActivityEntity.columnKey} = ?",
      whereArgs: [key],);
    return ActivityEntity.fromMapList(maps);
  }

  Future<void> addActivityToLiked(ActivityEntity activity) async {
    await db.insert(ActivityEntity.tableName, activity.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }


  Future<void> removeActivityByKey(int key) async {
    await db.delete(ActivityEntity.tableName,
      where: "${ActivityEntity.columnKey} = ?",
      whereArgs: [key],);
  }
}