import 'package:equatable/equatable.dart';

class DataEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  const DataEntity({this.id, this.title, this.description});

  @override
  List<Object?> get props => [id, title, description];

  Map<String, dynamic> get toJson =>
      {'title': title, 'description': description};
}
