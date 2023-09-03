import 'dart:io';
import 'package:boutiq_provider/core/utils/size.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../router/router.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddNewProductState();
  }
}

class _AddNewProductState extends ConsumerState<AddNewProduct> {
  final ImagePicker img_picker = ImagePicker();
  List<XFile>? selectedImages;

  var _textEditingController;
  String _errorText = '';
  List<String> selectedFilters = [];

  List<String> availableFilters = [
    'Jewel',
    'Shoes',
    'Accessories',
    'Cloths',
    'Care',
  ];

  void _validateInput(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorText = 'This field cannot be empty';
      });
    } else {
      setState(() {
        _errorText = '';
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _deleteImage(int index) {
    setState(() {
      selectedImages?.removeAt(index);
    });
  }

  openImages() async {
    try {
      var selected_files = await img_picker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (selected_files != null) {
        selectedImages = selected_files;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: ShapeDecoration(
            color: Colors.grey.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Add Product",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              productName(),
                              category(),
                              subcategory(),
                              price(),
                              description(),
                              tags()
                            ],
                          )),
                    ),
                    const HorizontalMargin(10),
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            fileUpload(),
                            selectedImageList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _publishProduct(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _publishProduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: () {
          GoRouter.of(context).goNamed(RouteConstants.addnewproduct);
        },
        icon: const Icon(Icons.published_with_changes, size: 25),
        label: Padding(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Publish",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  productName() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Name',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter product name.',
              border: const OutlineInputBorder(),
            ),
            onChanged: _validateInput,
          ),
        ],
      ),
    );
  }

  category() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter category.',
              border: const OutlineInputBorder(),
            ),
            onChanged: _validateInput,
          ),
        ],
      ),
    );
  }

  subcategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sub Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter sub category.',
              border: const OutlineInputBorder(),
            ),
            onChanged: _validateInput,
          ),
        ],
      ),
    );
  }

  price() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter price.',
              border: const OutlineInputBorder(),
            ),
            onChanged: _validateInput,
          ),
        ],
      ),
    );
  }

  description() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter description about the product.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            onChanged: _validateInput,
          ),
        ],
      ),
    );
  }

  tags() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalMargin(10),
          // Editable Text Field
          Container(
            width: double.infinity,
            height: 100,
            decoration: ShapeDecoration(
              color: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                children: availableFilters.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FilterChip(
                      label: Text(filter),
                      selected: selectedFilters.contains(filter),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedFilters.add(filter);
                          } else {
                            selectedFilters.remove(filter);
                          }
                        });
                      },
                      selectedColor: Colors.blue,
                      backgroundColor: Colors.grey.shade300,
                      side: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  fileUpload() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: DottedBorder(
        color: Colors.blue, // Customize the border color
        strokeWidth: 2, // Adjust the border thickness
        radius: const Radius.circular(15), // Adjust the border radius
        child: InkWell(
          onTap: () {
            openImages();
          },
          child: const SizedBox(
            width: double.infinity, // Adjust the width as needed
            height: 200, // Adjust the height as needed
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt, // You can use any icon you like
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectedImageList() {
    return selectedImages != null
        ? Wrap(
            children: selectedImages!.map((imageone) {
              return Card(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(File(imageone.path).path),
                ),
              );
            }).toList(),
          )
        : Container();
  }
}

class ImageItemWidget extends StatelessWidget {
  final XFile? imageFile;
  final String? imageName;
  final Function onDelete;

  ImageItemWidget({
    required this.imageFile,
    required this.imageName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageFile!.path,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(imageName!),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          onDelete();
        },
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
