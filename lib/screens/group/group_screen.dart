import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var groups = [
      {"title": "Categoria 1"},
      {"title": "Categoria 2"},
      {"title": "Categoria 3"},
      {"title": "Categoria 4"},
      {"title": "Categoria 5"},
      {"title": "Categoria 6"},
      {"title": "Categoria 6"},
      {"title": "Categoria 6"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Grupos"),
        actions: [
          IconButton(icon: Icon(Icons.filter_list, size: 26), onPressed: () {}),
        ],
        centerTitle: true,
        elevation: 1,
      ),
      body: GridView.count(
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
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(group["title"] ?? "")),
            );
          }),
        ],
      ),
    );
  }
}
