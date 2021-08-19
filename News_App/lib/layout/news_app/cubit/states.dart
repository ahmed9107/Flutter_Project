abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessFailedState extends NewsStates {

  final String error;

  NewsGetBusinessFailedState(this.error);

}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsFailedState extends NewsStates {

  final String error;

  NewsGetSportsFailedState(this.error);

}

class NewsGetSciencesLoadingState extends NewsStates {}

class NewsGetSciencesSuccessState extends NewsStates {}

class NewsGetSciencesFailedState extends NewsStates {

  final String error;

  NewsGetSciencesFailedState(this.error);

}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchFailedState extends NewsStates {

  final String error;

  NewsGetSearchFailedState(this.error);

}

