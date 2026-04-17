import 'package:tarefas/database/app_db.dart';
import 'package:tarefas/models/group.dart';

class GroupRepository {
  Future<List<Group>> getAll() async {
    final db = await AppDatabase.instance.database;
    final result = await db.query('groups');
    return result.map((map) => Group.fromMap(map)).toList();
  }

  Future<List<Group>> getGroupsWithTaskCount() async {
    final db = await AppDatabase.instance.database;

    final result = await db.rawQuery('''
    SELECT g.*, COUNT(t.id) as taskCount
    FROM groups g
    LEFT JOIN tasks t ON t.groupId = g.id
    GROUP BY g.id
  ''');

    return result.map((e) => Group.fromMap(e)).toList();
  }

  Future<int> insert(Group group) async {
    final db = await AppDatabase.instance.database;
    return await db.insert('groups', group.toMap());
  }

  Future<int> update(Group group) async {
    final db = await AppDatabase.instance.database;
    return await db.update(
      'groups',
      group.toMap(),
      where: 'id = ?',
      whereArgs: [group.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await AppDatabase.instance.database;
    return await db.delete('groups', where: 'id = ?', whereArgs: [id]);
  }
}
