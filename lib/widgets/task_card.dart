import 'package:flutter/material.dart';
import 'package:task_manager_ui/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Draggable<Task>(
      dragAnchorStrategy: pointerDragAnchorStrategy,
      data: task,
      feedback: Text(
        task.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildimage(),
            ..._buildCardInfo(context),
            const SizedBox(
              height: 10,
            ),
            _buildCardAdditionalInfo()
          ],
        ),
      ),
    );
  }

  Widget _buildCardAdditionalInfo() {
    return (task.commentCount > 0 || task.attachmentCount > 0)
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                (task.commentCount > 0)
                    ? Row(
                        children: [
                          Text('${task.commentCount}'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.comment)
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 10,
                ),
                (task.attachmentCount > 0)
                    ? Row(
                        children: [
                          Text('${task.attachmentCount}'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.link)
                        ],
                      )
                    : SizedBox()
              ],
            ))
        : const SizedBox();
  }

  List<Widget> _buildCardInfo(BuildContext context) {
    return [
      Text(
        task.title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        task.description,
        maxLines: 2,
      ),
    ];
  }

  Widget _buildimage() {
    return (task.image == null)
        ? SizedBox()
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: task.image,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          );
  }
}
