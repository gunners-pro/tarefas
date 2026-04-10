import 'package:tarefas/models/group.dart';

abstract class GroupEvent {}

class LoadGroups extends GroupEvent {}

class AddGroup extends GroupEvent {
  final Group group;
  AddGroup(this.group);
}

class UpdateGroup extends GroupEvent {
  final Group group;
  UpdateGroup(this.group);
}

class DeleteGroup extends GroupEvent {
  final int id;
  DeleteGroup(this.id);
}
