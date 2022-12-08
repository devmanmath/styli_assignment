import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styli_assignment/country_bloc/country_bloc.dart';
import 'package:styli_assignment/model/country_model.dart';
import 'package:styli_assignment/router/route_paths.dart';

class CountryList extends StatelessWidget {
  final List<CountryModel> countryList;
  const CountryList({super.key, required this.countryList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Countries"), centerTitle: true, elevation: 0),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            color: Colors.grey.withAlpha(80),
            child: Text(
              "SEARCH",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextFormField(
              autofocus: false,
              onChanged: (searchText) {
                BlocProvider.of<CountryBloc>(context)
                    .add(SearchCountryEvent(countryList, searchText));
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Countries',
              )),
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            color: Colors.grey.withAlpha(80),
            child: BlocBuilder<CountryBloc, CountryState>(
              buildWhen: (previous, current) =>
                  current is SearchCountrySuccessState,
              builder: (context, state) {
                if (state is SearchCountrySuccessState) {
                  return Text(
                    "COUNT: ${state.countryList.length}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }
                return Text(
                  "COUNT: ${countryList.length}",
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              },
            ),
          ),
          BlocBuilder<CountryBloc, CountryState>(
            buildWhen: (previous, current) =>
                current is SearchCountrySuccessState,
            builder: (context, state) {
              if (state is SearchCountrySuccessState) {
                return CountryListWidget(countryList: state.countryList);
              }
              return CountryListWidget(countryList: countryList);
            },
          ),
        ],
      ),
    );
  }
}

class CountryListWidget extends StatelessWidget {
  const CountryListWidget({
    Key? key,
    required this.countryList,
  }) : super(key: key);

  final List<CountryModel> countryList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: countryList.isNotEmpty
          ? Stack(
              children: [
                ListView.builder(
                    itemCount: countryList.length,
                    itemBuilder: (context, index) {
                      final CountryModel country = countryList[index];
                      return Card(
                        child: ListTile(
                          onTap: () => {
                            FocusManager.instance.primaryFocus?.unfocus(),
                            Navigator.of(context).pushNamed(
                                RoutePaths.countryDetails,
                                arguments: country)
                          },
                          leading: Hero(
                            tag: "${country.commonName}",
                            child: SizedBox(
                              width: 60,
                              child: CachedNetworkImage(
                                imageUrl: country.flags?.png ?? "",
                                fit: BoxFit.contain,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        "assets/images/image-preview.jpg"),
                              ),
                            ),
                          ),
                          title: Text("${country.countryName?.common}",
                              overflow: TextOverflow.ellipsis),
                          subtitle: Text("${country.region}",
                              style: Theme.of(context).textTheme.labelMedium),
                        ),
                      );
                    }),
              ],
            )
          : const Center(
              child: Text("Data Not Found"),
            ),
    );
  }
}
