import 'dart:convert';

import 'package:styli_assignment/model/country_capital_info_model.dart';
import 'package:styli_assignment/model/country_currency_model.dart';
import 'package:styli_assignment/model/country_flags_model.dart';
import 'package:styli_assignment/model/country_language_model.dart';
import 'package:styli_assignment/model/country_maps_model.dart';
import 'package:styli_assignment/model/country_name_model.dart';

class CountryModel {
  final String? commonName;
  final CountryName? countryName;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Currencies? currencies;
  final List<dynamic>? capital;
  final List<dynamic>? altSpellings;
  final String? region;
  final String? subregion;
  final Languages? languages;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;
  final Flags? flags;
  final Maps? maps;

  CountryModel(
      {this.commonName,
      this.countryName,
      this.independent,
      this.status,
      this.unMember,
      this.currencies,
      this.region,
      this.subregion,
      this.languages,
      this.startOfWeek,
      this.capitalInfo,
      this.capital,
      this.altSpellings,
      this.flags,
      this.maps});

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      countryName:
          json['name'] != null ? CountryName.fromJson(json['name']) : null,
      altSpellings: json['altSpellings'],
      capital: json['capital'],
      capitalInfo: json['capitalInfo'] != null
          ? CapitalInfo.fromJson(json['capitalInfo'])
          : null,
      region: json['region'],
      subregion: json['subregion'],
      languages: json['languages'] != null
          ? Languages.fromJson(json['languages'])
          : null,
      currencies: json['currencies'] != null
          ? Currencies.fromJson(json['currencies'])
          : null,
      independent: json['independent'],
      unMember: json['unMember'],
      status: json['status'],
      commonName: json['name']?['common'],
      startOfWeek: json['startOfWeek'],
      flags: json['flags'] != null ? Flags.fromJson(json['flags']) : null,
      maps: json['maps'] != null ? Maps.fromJson(json['maps']) : null);

  factory CountryModel.fromJsonDb(Map<String, dynamic> json) => CountryModel(
      countryName: json['CountryName'] != null
          ? CountryName.fromJson(jsonDecode(json['CountryName']))
          : null,
      altSpellings: json['AltSpellings'] != null
          ? jsonDecode(json['AltSpellings'])
          : null,
      capital: json['Capital'] != null ? jsonDecode(json['Capital']) : null,
      capitalInfo: json['capitalInfo'] != null
          ? CapitalInfo.fromJson(json['capitalInfo'])
          : null,
      region: json['Region'],
      subregion: json['Subregion'],
      languages: json['Languages'] != null
          ? Languages.fromJson(jsonDecode(json['Languages']))
          : null,
      currencies: json['Currencies'] != null
          ? Currencies.fromJson(jsonDecode(json['Currencies']))
          : null,
      independent: json['Independent'] == 1 ? true : false,
      unMember: json['unMember'] == 1 ? true : false,
      status: json['status'],
      commonName: json['CommonName'],
      startOfWeek: json['startOfWeek'],
      flags: json['Flags'] != null
          ? Flags.fromJson(jsonDecode(json['Flags']))
          : null,
      maps: json['Maps'] != null
          ? Maps.fromJson(jsonDecode(json['Maps']))
          : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countryName != null) {
      data['name'] = countryName!.toJson();
    }
    data['independent'] = independent;
    data['status'] = status;
    data['unMember'] = unMember;
    if (currencies != null) {
      data['currencies'] = currencies!.toJson();
    }
    data['capital'] = capital;
    data['altSpellings'] = altSpellings;
    data['region'] = region;
    data['subregion'] = subregion;
    if (languages != null) {
      data['languages'] = languages!.toJson();
    }
    data['startOfWeek'] = startOfWeek;
    if (capitalInfo != null) {
      data['capitalInfo'] = capitalInfo!.toJson();
    }
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (maps != null) {
      data['maps'] = maps!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toDataMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countryName != null) {
      data['CommonName'] = countryName?.common;
      data['CountryName'] = jsonEncode(countryName?.toJson());
    }
    if (independent != null) {
      data['Independent'] = independent == true ? 1 : 0;
    }
    if (status != null) {
      data['Status'] = status;
    }
    if (unMember != null) {
      data['UnMember'] = unMember == true ? 1 : 0;
    }
    if (currencies != null) {
      data['Currencies'] = jsonEncode(currencies?.toJson());
    }
    if (capital != null) {
      data['Capital'] = jsonEncode(capital);
    }
    if (altSpellings != null) {
      data['AltSpellings'] = jsonEncode(altSpellings);
    }
    if (region != null) {
      data['Region'] = region;
    }
    if (subregion != null) {
      data['Subregion'] = subregion;
    }
    if (languages != null) {
      data['Languages'] = jsonEncode(languages?.toJson());
    }
    if (startOfWeek != null) {
      data['StartOfWeek'] = startOfWeek;
    }
    if (capitalInfo != null) {
      data['CapitalInfo'] = jsonEncode(capitalInfo?.toJson());
    }
    if (flags != null) {
      data['Flags'] = jsonEncode(flags!.toJson());
    }
    if (maps != null) {
      data['Maps'] = jsonEncode(maps!.toJson());
    }
    return data;
  }
}
