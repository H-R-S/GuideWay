import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/images.dart';
import '../../../resources/data/countries.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/country_container/country_container.dart';
import '../../widgets/search_bar/my_search_bar.dart';

class CountryScreen extends StatefulWidget {
  final int? countryId;

  const CountryScreen({super.key, this.countryId});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController countryIdController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    if (widget.countryId != null) {
      int index =
          countries.indexWhere((country) => country.id == widget.countryId);

      if (index >= 0) {
        setState(() {
          seletedIndex = index;
          searchController.text = countries[index].name!;
          countryIdController.text = countries[index].id.toString();
        });
      }
    }
  }

  int seletedIndex = 0;

  onSeleted(int index) {
    setState(() {
      seletedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userViewModel = Provider.of<UserViewModel>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Find Your Destination",
                      style: TextStyle(
                          color: isDark ? Colors.white : null,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const Text(
                      "Browse the list of countries below and select where you want to travel abroad with GuideWay.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                  const SizedBox(height: 40),
                  MySearchBar(
                      hint: "Search your desire country",
                      controller: searchController,
                      onChanged: (value) {
                        debugPrint(searchController.text);
                      }),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 350,
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
                                              text: countries[index].name);
                                      countryIdController.value =
                                          countryIdController.value.copyWith(
                                              text: countries[index]
                                                  .id
                                                  .toString());
                                    },
                                    flag: countries[index].flag ?? emptyImage,
                                    title: countries[index].name ?? "",
                                    isChecked:
                                        seletedIndex == index ? true : false);
                              }))),
                  const SizedBox(height: 40),
                  MyElevatedButton(
                      isLoading: userViewModel.loading,
                      title: "Confirm",
                      onTap: () {
                        userViewModel.updateUserCountry(
                            context, int.parse(countryIdController.text));
                      })
                ])));
  }
}
