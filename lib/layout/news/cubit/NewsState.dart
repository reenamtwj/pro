abstract class NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String Error;
  NewsGetBusinessErrorState(this.Error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates {
  final String Error;
  NewsGetSportErrorState(this.Error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsScienceSuccessState extends NewsStates {}

class NewsGetScineceErrorState extends NewsStates {
  final String Error;
  NewsGetScineceErrorState(this.Error);
}

class NewsSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String Error;
  NewsGetSearchErrorState(this.Error);
}

class NewsGetScinceLoadingState extends NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsModeState extends NewsStates {}
