part of 'country_bloc.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class FetchCountryInPregress extends CountryState {}

class CountryListSuccessState extends CountryState {
  final List<CountryModel> countryList;

  CountryListSuccessState(this.countryList);
}

class CountrtListFailureState extends CountryState {
  final AppException appException;

  CountrtListFailureState(this.appException);
}

class SearchCountryInProgessState extends CountryState {}

class SearchCountrySuccessState extends CountryState {
  final List<CountryModel> countryList;

  SearchCountrySuccessState(this.countryList);
}
