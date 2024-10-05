import 'package:bloc_app/Core/Utils/Failures/data_state.dart';
import 'package:bloc_app/Features/Main/Data/Models/data_model.dart';
import 'package:bloc_app/Features/Main/Data/Sources/Remote/api_service.dart';
import 'package:bloc_app/Features/Main/Domain/Entities/data_entity.dart';
import 'package:bloc_app/Features/Main/Domain/Repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _apiProvider = ApiService();
  @override
  Future<DataState<List<DataEntity>>> callGet() async {
    try {
      List<dynamic> response = await _apiProvider.callGet();
      List<DataEntity> dataList =
          response.map((item) => DataModel.fromJson(item)).toList();
      for (var element in dataList) {
        print(
            "ID: ${element.id}, Title: ${element.title}, Description: ${element.description}");
      }
      return DataSuccess(dataList);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<void> callPost({required DataEntity body}) async {
    _apiProvider.callPost(body: body.toJson);
  }

  @override
  Future<void> callDelete({required DataEntity body}) async {
    _apiProvider.callDelete(body: body.toJson);
  }
}
