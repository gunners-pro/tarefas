import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarefas/blocs/group/group_events.dart';
import 'package:tarefas/blocs/group/group_states.dart';
import 'package:tarefas/repositories/group_repository.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepository repository;

  GroupBloc(this.repository) : super(GroupInitial()) {
    on<LoadGroups>((event, emit) async {
      emit(GroupLoading());
      try {
        final groups = await repository.getAll();
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupError("Erro ao carregar grupos"));
      }
    });

    on<AddGroup>((event, emit) async {
      try {
        await repository.insert(event.group);
        final groups = await repository.getAll();
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupError("Erro ao adicionar grupo"));
      }
    });

    on<UpdateGroup>((event, emit) async {
      try {
        await repository.update(event.group);
        final groups = await repository.getAll();
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupError("Erro ao atualizar grupo"));
      }
    });

    on<DeleteGroup>((event, emit) async {
      try {
        await repository.delete(event.id);
        final groups = await repository.getAll();
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupError("Erro ao deletar grupo"));
      }
    });
  }
}
