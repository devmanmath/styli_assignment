part of 'country_bloc.dart';

abstract class CountryEvent {}

class FetchCountryInitial extends CountryEvent {}

class SearchCountryEvent extends CountryEvent {
  final List<CountryModel> countryList;
  final String searchText;

  SearchCountryEvent(this.countryList, this.searchText);
}
