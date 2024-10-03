import 'package:bloc_app/Features/Domain/Entities/data_entity.dart';
import 'package:bloc_app/Features/Presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Bloc App'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              width: width * 0.7,
              child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: 'Title')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 0.7,
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => bloc.add(AddItemEvent(DataEntity(
                      title: titleController.text,
                      description: descriptionController.text,
                    ))),
                child: const Text('Create Item')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => bloc.add(DeleteItemEvent(DataEntity(
                      title: titleController.text,
                      description: descriptionController.text,
                    ))),
                child: const Text('Delete Item')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => bloc.add(ClearDataEvent()),
                child: const Text('Clear Data')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.blue)),
                onPressed: () => bloc.add(FetchDataEvent()),
                child: const Text('Fetch Data')),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is FetchDataLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchDataErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              if (state is FetchDataCompletedState) {
                if (state.todos.isEmpty) {
                  return const Text('Empty');
                }
                return SizedBox(
                  width: width * 0.8,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      DataEntity item = state.todos[index];
                      return SizedBox(
                        height: 40,
                        child: Text(
                            textAlign: TextAlign.center,
                            'ID: ${item.id}    Title: ${item.title}      Description: ${item.description}'),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
