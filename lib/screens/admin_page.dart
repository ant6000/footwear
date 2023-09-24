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
  String dropdownValue = 'Select';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image: selectedImage == null ? DecorationImage(image: AssetImage('images/antor.png')): DecorationImage(image: FileImage(selectedImage!)),
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
                readOnly: true,
                controller: id,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    //labelText: 'ID',
                    hintText: randomString(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
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
                  DropdownMenuItem(value: 'Select', child: Text('Select')),
                  DropdownMenuItem(value: 'lopers', child: Text('lopers')),
                  DropdownMenuItem(value: 'Snikers', child: Text('Snikers')),
                  DropdownMenuItem(value: 'Boot', child: Text('Boot')),
                  DropdownMenuItem(
                      value: 'Flip-flops', child: Text('Flip-flops')),
                  DropdownMenuItem(value: 'Sports', child: Text('Sports')),
                  DropdownMenuItem(
                      value: 'Bssketball', child: Text('Bssketball')),
                  DropdownMenuItem(value: 'Wedge', child: Text('Wedge')),
                  DropdownMenuItem(value: 'Hiking', child: Text('Hiking')),
                  DropdownMenuItem(value: 'Derby', child: Text('Derby')),
                  DropdownMenuItem(value: 'Climbing', child: Text('Climbing')),
                  DropdownMenuItem(value: 'Golf', child: Text('Golf')),
                  DropdownMenuItem(value: 'High top', child: Text('High top')),
                  DropdownMenuItem(
                      value: 'Kitten heel', child: Text('Kitten heel')),
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
                          'imageUrl',
                          randomString(20),
                          title.text,
                          details.text,
                          double.parse(price.text),
                          dropdownValue);

                      if (isUploaded) {
                        Fluttertoast.showToast(
                            msg: 'Uploaded Successfully',
                            backgroundColor: Colors.amber,
                            textColor: Colors.white,
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Uploaded Failed',
                            backgroundColor: Colors.amber,
                            textColor: Colors.white,
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT);
                      }
                    },
                    child: const Text('Upload')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
