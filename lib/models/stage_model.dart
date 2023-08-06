import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Stage extends Equatable {
  final String id;
  final String name;
  final Color color;

  Stage({required this.id, required this.color, required this.name});

  static List<Stage> stages = [
    Stage(color: Colors.red, id: 'todo', name: 'TO DO'),
    Stage(id: 'inProgress', color: Colors.orange, name: 'In Progess'),
    Stage(id: 'underReviews', color: Colors.yellow, name: 'Under Review'),
    Stage(id: 'done', color: Colors.green, name: 'Done')
  ];

  @override
  List<Object?> get props => [id, name, color];
}
