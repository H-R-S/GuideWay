import 'package:flutter/material.dart';
import 'package:guide_way/routes/routes_name.dart';
import '../../../resources/data/countries.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/country_container/country_container.dart';
import '../../widgets/search_bar/my_search_bar.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  TextEditingController searchController = TextEditingController();

  bool isChecked = false;

  int seletedIndex = 0;

  onSeleted(int index) {
    setState(() {
      seletedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Find Your Study Destination",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text(
                      "Browse the list of countries below and select where you want to study abroad with GuideWay.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                  const SizedBox(height: 40),
                  MySearchBar(
                      hint: "Search your desire country",
                      controller: searchController,
                      onChanged: (value) {}),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 400,
                      child: SingleChildScrollView(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: countries.length,
                              itemBuilder: (context, index) {
                                return CountryContainer(
                                    onTap: () {
                                      onSeleted(index);
                                      searchController.value =
                                          searchController.value.copyWith(
                                              text: countries[index]["name"]);
                                    },
                                    flag: countries[index]["flag"],
                                    title: countries[index]["name"],
                                    isChecked:
                                        seletedIndex == index ? true : false);
                              }))),
                  const SizedBox(height: 40),
                  MyElevatedButton(
                      title: "Confirm",
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.home);
                      })
                ])));
  }
}
