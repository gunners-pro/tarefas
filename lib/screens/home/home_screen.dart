import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tarefas/blocs/group/group_blocs.dart';
import 'package:tarefas/blocs/group/group_states.dart';
import 'package:tarefas/models/group.dart';
import 'package:tarefas/screens/home/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              const TopBar(),
              const SizedBox(height: 12.0),
              const _DatePickerCard(),
              const SizedBox(height: 20.0),
              const _SearchField(),
              const SizedBox(height: 20.0),
              _GroupsHeader(
                onViewAll: () => Navigator.of(context).pushNamed('/group'),
              ),
              const SizedBox(height: 10.0),
              const _GroupList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DatePickerCard extends StatelessWidget {
  const _DatePickerCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.outline,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DatePicker(
        DateTime.now(),
        height: 88,
        initialSelectedDate: DateTime.now(),
        selectionColor: colorScheme.primary,
        selectedTextColor: Colors.white,
        locale: 'pt_br',
        daysCount: 8,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.outline,
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Pesquisar Tarefa',
          hintStyle: TextStyle(color: Colors.grey[700]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _GroupsHeader extends StatelessWidget {
  const _GroupsHeader({required this.onViewAll});

  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Grupos',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Row(
            children: [Text('Ver todos'), Icon(Icons.keyboard_arrow_right)],
          ),
        ),
      ],
    );
  }
}

class _GroupList extends StatelessWidget {
  const _GroupList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is GroupLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GroupsLoaded) {
          return SizedBox(
            width: double.infinity,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.groups.length,
              itemBuilder: (ctx, index) =>
                  _GroupCard(group: state.groups[index]),
            ),
          );
        }

        return const Center(child: Text('Nenhum grupo encontrado'));
      },
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.group});
  final Group group;

  @override
  Widget build(BuildContext context) {
    final color = Color(int.parse(group.color));

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.outline,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                group.imageSvg,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.title.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Total ${group.taskCount}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_right,
                    color: color,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
