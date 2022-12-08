import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styli_assignment/model/country_model.dart';
import 'package:styli_assignment/repository/country_repository.dart';
import 'package:styli_assignment/utils/custom_exception.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(this.countryRepository) : super(CountryInitial()) {
    on<FetchCountryInitial>(_onFetchCountryInitial);
    on<SearchCountryEvent>(_onSearchCountryEvent, transformer: restartable());
  }

  final CountryRepository countryRepository;

  FutureOr<void> _onFetchCountryInitial(
      FetchCountryInitial event, Emitter<CountryState> emit) async {
    try {
      emit(FetchCountryInPregress());
      List<Map<String, dynamic>> countryList =
          await countryRepository.fetchCountryFromDb();
      if (countryList.isNotEmpty) {
        List<CountryModel> cList = [];
        for (int i = 0; i < countryList.length; i++) {
          CountryModel country = CountryModel.fromJsonDb(countryList[i]);
          cList.add(country);
        }
        cList.sort((a, b) => a.commonName != null
            ? a.commonName!.compareTo(b.commonName ?? '')
            : 1);
        emit(CountryListSuccessState(cList));
      } else {
        List<dynamic> data = await countryRepository.fetchCountry();
        List<CountryModel> countryList =
            List<CountryModel>.from(data.map((e) => CountryModel.fromJson(e)));
        for (int i = 0; i < countryList.length; i++) {
          Map<String, dynamic> countryData = countryList[i].toDataMap();
          await countryRepository.insertCountry(countryData);
        }
        countryList.sort((a, b) => a.commonName != null
            ? a.commonName!.compareTo(b.commonName ?? '')
            : 1);
        emit(CountryListSuccessState(countryList));
      }
    } on AppException catch (e) {
      emit(CountrtListFailureState(e));
    } catch (_) {
      emit(CountrtListFailureState(AppException(
          exceptionType: ExceptionType.general, message: "Try Again")));
    }
  }

  FutureOr<void> _onSearchCountryEvent(
      SearchCountryEvent event, Emitter<CountryState> emit) async {
    try {
      emit(SearchCountryInProgessState());
      if (event.searchText.isNotEmpty) {
        final List<CountryModel> countryList = event.countryList
            .where((e) => e.commonName!
                .toLowerCase()
                .contains(event.searchText.toLowerCase()))
            .toList();
        emit(SearchCountrySuccessState(countryList));
      } else {
        emit(SearchCountrySuccessState(event.countryList));
      }
    } catch (_) {}
  }
}
