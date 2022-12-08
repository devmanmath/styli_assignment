import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styli_assignment/country_bloc/country_bloc.dart';
import 'package:styli_assignment/router/route_paths.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountryBloc>(context).add(FetchCountryInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: BlocConsumer<CountryBloc, CountryState>(
        listenWhen: (oldState, newState) =>
            newState is FetchCountryInPregress ||
            newState is CountryListSuccessState,
        listener: (context, state) {
          if (state is CountryListSuccessState) {
            Navigator.pushReplacementNamed(context, RoutePaths.countryList,
                arguments: state.countryList);
          }
        },
        buildWhen: (oldState, newState) =>
            newState is FetchCountryInPregress ||
            newState is CountryListSuccessState ||
            newState is CountrtListFailureState,
        builder: (context, state) {
          if (state is FetchCountryInPregress) {
            return Center(
              child: Text("Loading...",
                  style: Theme.of(context).textTheme.labelLarge),
            );
          } else if (state is CountrtListFailureState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.appException.message,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (() => BlocProvider.of<CountryBloc>(context)
                          .add(FetchCountryInitial())),
                      child: const Text("Try Again"))
                ],
              ),
            );
          }
          return Center(
              child: Text(
            "Demo App,",
            style: Theme.of(context).textTheme.labelLarge,
          ));
        },
      ),
    );
  }
}
