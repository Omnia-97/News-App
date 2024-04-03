import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/bloc/states.dart';
import '../../models/NewsDataModel.dart';
import '../../models/SourceResponse.dart';
import '../repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepoDs repo;
  HomeCubit(this.repo)
      : super(
          HomeInitialState(),
        );
  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;
  static HomeCubit get(context) => BlocProvider.of(context);
  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedSource());
  }

  Future<void> getSources(String categoryID) async {
    emit(HomeGetSourcesLoadingState());
    try {
      var sourceResponse = await repo.getSources(categoryID);
      sources = sourceResponse.sources ?? [];
      emit(
        HomeGetSourcesSuccessState(),
      );
    } catch (e) {
      emit(
        HomeGetSourcesErrorState(
          e.toString(),
        ),
      );
    }
  }

  Future<void> getNewsData(String searchQuery) async {
    try {
      emit(HomeGetNewsLoadingState());
      var newsDataModel =
          await repo.getNewsData(searchQuery, sources[selectedIndex].id ?? "");
      articles = newsDataModel.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }
}
