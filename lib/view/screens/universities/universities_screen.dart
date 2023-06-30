import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/models/university/university_model.dart';
import 'package:guide_way/resources/data/universities.dart';
import 'package:guide_way/routes/routes.dart';
import 'package:guide_way/view/screens/detail/detail_screen.dart';
import 'package:guide_way/view/widgets/button/my_elevated_button.dart';
import 'package:guide_way/view/widgets/text_field/my_text_field.dart';
import 'package:guide_way/view_models/university/university_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../models/country/country_model.dart';
import '../../../resources/constants/flags.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/image_container/image_container.dart';

class UniversitiesScreen extends StatefulWidget {
  UniversitiesScreen({super.key});

  @override
  State<UniversitiesScreen> createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  final CountryModel countryModel = CountryModel(
      id: 1,
      name: "USA",
      flag:
          "https://firebasestorage.googleapis.com/v0/b/guide-wayy.appspot.com/o/flags%2Fusa_flag.png?alt=media&token=0f05d040-30c9-4a86-a3cf-60b9ba06845c",
      dialingCode: "+1",
      capital: "Washington D.C",
      latitude: 38.9072,
      longitude: 77.0369,
      currency: "United States Dollar",
      currencyCode: "USD",
      domain: ".us");

  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();

    setState(() {
      _selectedImages = images.map((XFile image) => File(image.path)).toList();
    });
  }

  Future<List<String>> _uploadImagesToFirebase(List<File> images) async {
    List<String> downloadUrls = [];

    for (int i = 0; i < images.length; i++) {
      File image = images[i];
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference reference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }

    return downloadUrls;
  }

  @override
  Widget build(BuildContext context) {
    final universityViewModel = Provider.of<UniversityViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Universities"),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            MyTextField(controller: nameController, hint: "Name"),
            MyTextField(controller: websiteController, hint: "Website"),
            MyTextField(controller: descriptionController, hint: "Description"),
            MyTextField(controller: cityController, hint: "City"),
            MyTextField(controller: stateController, hint: "State"),
            MyTextField(controller: latitudeController, hint: "Latitude"),
            MyTextField(controller: longitudeController, hint: "Longitude"),
            const SizedBox(height: 20),
            MyElevatedButton(title: "Select Image", onTap: _pickImages),
            const SizedBox(height: 20),
            MyElevatedButton(
                isLoading: universityViewModel.loading,
                title: "Upload",
                onTap: () async {
                  List<String> imageUrls =
                      await _uploadImagesToFirebase(_selectedImages);
                  // ignore: use_build_context_synchronously
                  universityViewModel.addUniversity(
                      context,
                      UniversityModel(
                          id: Timestamp.now().microsecondsSinceEpoch,
                          country: countryModel,
                          city: cityController.text.trim(),
                          state: stateController.text.trim(),
                          website: websiteController.text.trim(),
                          description: descriptionController.text.trim(),
                          latitude: num.parse(latitudeController.text),
                          longitude: num.parse(longitudeController.text),
                          images: imageUrls,
                          thumnailImage: imageUrls[0]));
                  debugPrint('Image URLs: $imageUrls');
                })
          ]),
          // child: Column(children: [
          //   ListView.builder(
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: universities.length,
          //       itemBuilder: (context, index) {
          //         return ImageContainer(
          //             name: universities[index]["name"],
          //             city: universities[index]["city"],
          //             image: universities[index]["image"],
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   getPageRoute(DetailScreen(
          //                       isWebsite: true,
          //                       title: universities[index]["name"])));
          //             });
          //       })
          // ])
        )));
  }
}
