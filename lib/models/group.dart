class Group {
  final int? id;
  final String title;
  final String color;
  final String imageSvg;
  final int taskCount;

  Group({
    this.id,
    required this.title,
    required this.color,
    required this.imageSvg,
    required this.taskCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color,
      'imageSvg': imageSvg,
      'taskCount': taskCount,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'],
      title: map['title'],
      color: map['color'],
      imageSvg: map['imageSvg'],
      taskCount: map['taskCount'],
    );
  }
}
