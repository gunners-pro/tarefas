import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

enum Priority { low, medium, high }

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Priority selected = Priority.medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar tarefa"),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              _TextFieldMultiLine(),
              _PrioritySelector(
                selected: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
              ),
              _DatePickerSelector(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldMultiLine extends StatelessWidget {
  const _TextFieldMultiLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        maxLines: null,
        expands: true,
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.justify,
        decoration: const InputDecoration(
          hintText: "Descreva a tarefa...",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _PrioritySelector extends StatelessWidget {
  final Priority selected;
  final ValueChanged<Priority> onChanged;

  const _PrioritySelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.label_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              const Text(
                "Prioridade",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            spacing: 8,
            children: Priority.values.map((p) {
              final isSelected = selected == p;
              Color color;
              String label;

              switch (p) {
                case Priority.low:
                  color = Colors.green;
                  label = "Baixa";
                  break;
                case Priority.medium:
                  color = Colors.blue;
                  label = "Média";
                  break;
                case Priority.high:
                  color = Colors.red;
                  label = "Alta";
                  break;
              }

              return Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onChanged(p),
                    splashColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: Ink(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isSelected ? color : Colors.white,
                        border: BoxBorder.all(width: 2, color: color),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _DatePickerSelector extends StatelessWidget {
  const _DatePickerSelector();

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final lastDate = DateTime(today.year, today.month + 6, today.day);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_calendar_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              const Text(
                "Data",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          DatePickerWidget(
            dateFormat: "dd-MMM-yyyy",
            firstDate: today,
            lastDate: lastDate,
            locale: DateTimePickerLocale.pt_br,
            pickerTheme: DateTimePickerTheme(
              backgroundColor: Colors.transparent,
              itemHeight: 25,
              pickerHeight: 100,
              dividerColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
