import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styli_assignment/country_bloc/country_bloc.dart';
import 'package:styli_assignment/repository/country_repository.dart';
import 'package:styli_assignment/router/route_paths.dart';
import 'package:styli_assignment/router/router.dart';
import 'package:styli_assignment/utils/database_helper.dart';
import 'package:styli_assignment/utils/network_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.createDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CountryBloc>(
            create: (context) {
              final CountryRepository countryRepository =
                  CountryRepository(NetworkManager(), DataBaseHelper());
              return CountryBloc(countryRepository);
            },
          )
        ],
        child: MaterialApp(
          title: 'Styli_Assignment',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoute,
          initialRoute: RoutePaths.splash,
        ));
  }
}
