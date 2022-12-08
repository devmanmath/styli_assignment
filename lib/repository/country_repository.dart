import 'package:styli_assignment/utils/custom_exception.dart';
import 'package:styli_assignment/utils/database_helper.dart';
import 'package:styli_assignment/utils/network_manager.dart';

class CountryRepository {
  final NetworkManager networkManager;
  final DataBaseHelper dataBaseHelper;

  CountryRepository(this.networkManager, this.dataBaseHelper);

  Future<List<Map<String, dynamic>>> fetchCountryFromDb() async {
    try {
      List<Map<String, dynamic>> result =
          await dataBaseHelper.fetchAll(tableName: DataBaseHelper.countryTable);
      return result;
    } catch (_) {
      throw AppException(
          exceptionType: ExceptionType.databseError,
          message: "Error in fetach data from sqflite");
    }
  }

  Future<void> insertCountry(Map<String, dynamic> data) async {
    try {
      await dataBaseHelper.insertData(
          tableName: DataBaseHelper.countryTable, data: data);
    } catch (e) {
      throw AppException(
          exceptionType: ExceptionType.databseError,
          message: "Error in insert data into sqflite");
    }
  }

  Future<dynamic> fetchCountry() async {
    try {
      var response =
          await networkManager.get("https://restcountries.com/v3.1/all");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
