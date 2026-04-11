import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tarefas/blocs/group/group_blocs.dart';
import 'package:tarefas/blocs/group/group_states.dart';
import 'package:tarefas/screens/home/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              TopBar(),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DatePicker(
                  DateTime.now(),
                  height: 88,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Theme.of(context).colorScheme.primary,
                  selectedTextColor: Colors.white,
                  locale: 'pt_br',
                  daysCount: 8,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.outline,
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Pesquisar Tarefa",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.grey[700],
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grupos",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pushNamed("/group"),
                    child: Row(
                      children: [
                        Text("Ver todos"),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              BlocBuilder<GroupBloc, GroupState>(
                builder: (context, state) {
                  if (state is GroupLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is GroupsLoaded) {
                    final groups = state.groups;

                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: groups.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            width: 160,
                            margin: EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {},
                              splashColor: Colors.grey[400],
                              borderRadius: BorderRadius.circular(12),
                              child: Ink(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      groups[index].imageSvg,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              groups[index].title.toUpperCase(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 17,
                                                color: Color(
                                                  int.parse(
                                                    groups[index].color,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Total ${groups[index].taskCount}",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.keyboard_double_arrow_right,
                                          color: Color(
                                            int.parse(groups[index].color),
                                          ),
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Center(child: Text("Nenhum grupo encontrado"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
