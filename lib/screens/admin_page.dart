import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footwear/provider/upload_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController id = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController details = TextEditingController();
  final TextEditingController price = TextEditingController();
  File? selectedImage;
  String dropdownValue = 'Default';

  String randomString(int length) {
    const characters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  Future _pickImageFromGalary() async {
    final imageUrl = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(imageUrl!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UploadProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Center(
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        image: selectedImage == null
                            ? const DecorationImage(
                                image: AssetImage(
                                    'images/default_profile_pic.png'))
                            : DecorationImage(image: FileImage(selectedImage!)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26),
                    child: IconButton(
                        onPressed: () {
                          _pickImageFromGalary();
                        },
                        icon: const Icon(Icons.add_box)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                      labelText: 'Enter Product title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: details,
                  decoration: InputDecoration(
                      labelText: 'Enter Product details',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: price,
                  decoration: InputDecoration(
                      labelText: 'Enter Product Price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.list),
                  items: const [
                    DropdownMenuItem(value: 'Default', child: Text('Default')),
                    DropdownMenuItem(value: 'Loafers', child: Text('Loafers')),
                    DropdownMenuItem(
                        value: 'Sneakers', child: Text('Sneakers')),
                    DropdownMenuItem(value: 'Running', child: Text('Running')),
                    DropdownMenuItem(
                        value: 'Flip-flops', child: Text('Flip-flops')),
                    DropdownMenuItem(value: 'Soccer', child: Text('Soccer')),
                    DropdownMenuItem(
                        value: 'Bssketball', child: Text('Bssketball')),
                    DropdownMenuItem(value: 'Boots', child: Text('Boots')),
                    DropdownMenuItem(value: 'Hiking', child: Text('Hiking')),
                    DropdownMenuItem(value: 'Golf', child: Text('Golf')),
                    DropdownMenuItem(
                        value: 'Sandals & Slides',
                        child: Text('Sandals & Slides')),
                    DropdownMenuItem(value: 'Oxfords', child: Text('Oxfords')),
                    DropdownMenuItem(value: 'Loafers', child: Text('Loafers')),
                    DropdownMenuItem(
                        value: 'Training & Gym', child: Text('Training & Gym')),
                    DropdownMenuItem(
                        value: 'Walking Shoes', child: Text('Walking Shoes')),
                    DropdownMenuItem(
                        value: 'Heels & Weadges',
                        child: Text('Heels & Weadges')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        bool isUploaded = await provider.uploadData(
                            selectedImage.toString(),
                            randomString(20),
                            title.text,
                            details.text,
                            50,
                            dropdownValue);
                        print(isUploaded);
                        if (isUploaded == true) {
                          Fluttertoast.showToast(
                              msg: 'Uploaded Successfully',
                              backgroundColor: Colors.amber,
                              textColor: Colors.white,
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT);
                        }
                        if (!isUploaded) {
                          Fluttertoast.showToast(
                              msg: 'Uploaded Failed',
                              backgroundColor: Colors.amber,
                              textColor: Colors.white,
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT);
                        }
                      },
                      child: provider.isLoading
                          ? CircularProgressIndicator()
                          : const Text('Upload')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
