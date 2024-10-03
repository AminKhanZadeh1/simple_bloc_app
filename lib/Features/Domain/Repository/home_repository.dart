import 'package:bloc_app/Core/Utils/Failures/data_state.dart';
import 'package:bloc_app/Features/Domain/Entities/data_entity.dart';

abstract class HomeRepository {
  // Get Body
  Future<DataState<List<DataEntity>>> callGet();

  // Post Body
  Future<void> callPost({required DataEntity body});

  // Delete Data
  Future<void> callDelete({required DataEntity body});
}
