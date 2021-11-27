import 'package:flutter/material.dart';

class TaskStatusTabModel {
  const TaskStatusTabModel({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<TaskStatusTabModel> taskStatusTabs = [
  TaskStatusTabModel(title: 'TODO', icon: Icons.task),
  TaskStatusTabModel(title: 'DOING', icon: Icons.directions_bike),
  TaskStatusTabModel(title: 'DONE', icon: Icons.directions_boat),
];
