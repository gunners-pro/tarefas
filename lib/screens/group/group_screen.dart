import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas/blocs/group/group_blocs.dart';
import 'package:tarefas/blocs/group/group_states.dart';
import 'package:tarefas/models/group.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  //   particular - 0xfff554bc
  // ux/ui - 0xff2ed62a
  // Escrever - 0xffb859e6
  // Meditar - 0xffffc02e
  // receitas - 0xff4096d6

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grupos"),
        actions: [
          IconButton(icon: Icon(Icons.filter_list, size: 26), onPressed: () {}),
        ],
        centerTitle: true,
        elevation: 1,
      ),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state is GroupLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is GroupsLoaded) {
            final groups = state.groups;

            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              padding: EdgeInsets.all(16),
              children: [
                InkWell(
                  splashColor: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue[100],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 40, color: Colors.blue),
                          Text(
                            "Novo grupo",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ...groups.map((group) {
                  return _gridViewItemGroup(context, group);
                }),
              ],
            );
          }

          return Center(child: Text("Nenhum grupo encontrado"));
        },
      ),
    );
  }

  Widget _gridViewItemGroup(BuildContext context, Group group) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.grey[400],
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(14),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.title.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          color: Color(int.parse(group.color)),
                        ),
                      ),
                      Text(
                        "Total ${group.taskCount}",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_right,
                    color: Color(int.parse(group.color)),
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
