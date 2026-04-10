import 'package:tarefas/models/group.dart';

abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoading extends GroupState {}

class GroupsLoaded extends GroupState {
  final List<Group> groups;
  GroupsLoaded(this.groups);
}

class GroupError extends GroupState {
  final String message;
  GroupError(this.message);
}
