import 'package:bloc_app/Core/Utils/Failures/data_state.dart';
import 'package:bloc_app/Features/Main/Domain/Entities/data_entity.dart';
import 'package:bloc_app/Features/Main/Domain/Repository/home_repository.dart';

class FetchDataUseCase {
  final HomeRepository homeRepository;

  FetchDataUseCase(this.homeRepository);

  Future<DataState<List<DataEntity>>> call() {
    return homeRepository.callGet();
  }
}

class AddItemUseCase {
  final HomeRepository homeRepository;

  AddItemUseCase(this.homeRepository);

  Future<void> call({required DataEntity body}) {
    return homeRepository.callPost(body: body);
  }
}

class DeleteItemUseCase {
  final HomeRepository homeRepository;

  DeleteItemUseCase(this.homeRepository);

  Future<void> call({required DataEntity body}) {
    return homeRepository.callDelete(body: body);
  }
}

class ClearDataUseCase {
  final HomeRepository homeRepository;

  ClearDataUseCase(this.homeRepository);

  Future<void> call() {
    return homeRepository.callPost(
        body: const DataEntity(title: 'clear', description: 'clear'));
  }
}
