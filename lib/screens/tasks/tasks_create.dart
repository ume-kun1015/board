import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'package:board/models/task_model.dart';
import 'package:board/providers/board_route_delegate_provider.dart';
import 'package:board/providers/tasks_provider.dart';

class TasksCreateScreen extends HookConsumerWidget {
  TasksCreateScreen({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final formatter = DateFormat('yyyy-MM-dd');

  Future<DateTime?> openDatePikcer(BuildContext context, DateTime date) {
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2021),
    );
  }

  Color? statusColor(String status) {
    if (status == taskStatusTodo) {
      return Colors.lime[100];
    }

    if (status == taskStatusDone) {
      return Colors.brown[100];
    }

    return Colors.amber;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleEditingController = useTextEditingController(text: '');
    final desciptionEditingController = useTextEditingController(text: '');
    final dateEditingController =
        useTextEditingController(text: formatter.format(DateTime.now()));
    final statusDropDownValue = useState(taskStatusTodo);

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク作成'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: titleEditingController,
                      maxLength: 12,
                      decoration:
                          const InputDecoration(hintText: 'タイトルを入力しましょう'),
                      keyboardType: TextInputType.text,
                      // ignore: missing_return
                      validator: (value) {
                        if (value!.isEmpty) return 'タイトルは必須項目です';
                        if (value.length > 12) return 'タイトルは12文字以内で入力してください';
                      },
                    ),
                    TextFormField(
                      controller: desciptionEditingController,
                      decoration:
                          const InputDecoration(hintText: '説明文を入力しましょう'),
                      keyboardType: TextInputType.text,
                      maxLength: 50,
                      // ignore: missing_return
                      validator: (value) {
                        if (value!.isEmpty) return '説明文は必須項目です';
                        if (value.length > 50) return '説明文は50文字以内で入力してください';
                      },
                    ),
                    DropdownButton(
                      value: statusDropDownValue.value,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String? newValue) {
                        statusDropDownValue.value = newValue ?? 'TODO';
                      },
                      items: [taskStatusTodo, taskStatusDoing, taskStatusDone]
                          .map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: statusColor(value),
                              ),
                              child: Text(value),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            controller: dateEditingController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          width: 96,
                          child: ElevatedButton(
                            child: const Text('日付設定'),
                            onPressed: () async {
                              final result = await openDatePikcer(
                                context,
                                DateTime.now(),
                              );

                              if (result == null) {
                                return;
                              }

                              final formatted = formatter.format(result);

                              dateEditingController.text = formatted;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('保存'),
                    onPressed: () {
                      final result = formKey.currentState!.validate();
                      if (!result) {
                        return;
                      }

                      ref.read(tasksProvider.notifier).add(
                            TaskModel(
                              id: const Uuid().v4(),
                              title: titleEditingController.text,
                              description: desciptionEditingController.text,
                              dueDateTime:
                                  DateTime.parse(dateEditingController.text),
                              status: statusDropDownValue.value,
                            ),
                          );

                      ref
                          .read(boardRouteDelegateProvider.notifier)
                          .setModeToList();
                    },
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
