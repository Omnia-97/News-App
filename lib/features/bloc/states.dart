abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetSourcesLoadingState extends HomeStates {}

class HomeGetSourcesSuccessState extends HomeStates {}

class HomeGetSourcesErrorState extends HomeStates {
  final String errorMessage;
  HomeGetSourcesErrorState(this.errorMessage);
}

class HomeGetNewsLoadingState extends HomeStates {}

class HomeGetNewsSuccessState extends HomeStates {}

class HomeGetNewsErrorState extends HomeStates {
  final String errorMessage;
  HomeGetNewsErrorState(this.errorMessage);
}

class ChangeSelectedSource extends HomeStates {}

class SearchQueryChangedState extends HomeStates {}
