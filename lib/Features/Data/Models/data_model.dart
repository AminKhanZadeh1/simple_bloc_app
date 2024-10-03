// ignore_for_file: non_constant_identifier_names

import 'package:bloc_app/Features/Domain/Entities/data_entity.dart';

class DataModel extends DataEntity {
  const DataModel({super.id, super.title, super.description});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
