import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:styli_assignment/model/country_model.dart';

class CountryDetails extends StatelessWidget {
  final CountryModel countryDetails;
  const CountryDetails({
    Key? key,
    required this.countryDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: "${countryDetails.commonName}",
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: countryDetails.flags?.png ?? "",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/image-preview.jpg"),
                  ),
                ),
              ),
            ),
            Text(
              "${countryDetails.commonName}",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "${countryDetails.region}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "The country ${countryDetails.commonName} located in ${countryDetails.region} region and the subregion is ${countryDetails.subregion}. The official name of the country is ${countryDetails.countryName?.official}. ${countryDetails.currencies?.mRU?.name != null ? '${countryDetails.currencies?.mRU?.name} is the currency of ${countryDetails.commonName}.' : ''} ",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
