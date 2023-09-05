import 'dart:io';

import 'package:boutiq_provider/core/utils/size.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../core/utils/responsive.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddNewProductState();
  }
}

class _AddNewProductState extends ConsumerState<AddNewProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final isValidate = ValueNotifier<bool>(false);

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? selectedImages;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _deliveryAmountController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<String> selectedTags = [];
  List<String> availableTags = [
    'Jewel',
    'Shoes',
    'Accessories',
    'Cloths',
    'Care',
  ];

  List<String> categoryList = <String>['men', 'women', "baby"];
  String categoryValue = "";
  List<String> subCategoryList = <String>[
    'I want this to be lengthy',
    'Two',
    'Three',
    'Four'
  ];
  String subCategoryValue = "";

  @override
  void initState() {
    categoryValue = categoryList.first;
    subCategoryValue = subCategoryList.first;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  openImages() async {
    try {
      var selectedFiles =
          await imagePicker.pickMultiImage(requestFullMetadata: true);
      //you can use ImageCourse.camera for Camera capture
      if (selectedFiles != null) {
        Set<XFile> uniqueImages = {...?selectedImages, ...selectedFiles};
        selectedImages = uniqueImages.toList();
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
      appBar: AppBar(
        title: Text(
          'New Product',
          style: GoogleFonts.lato(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        productName(),
                        category(),
                        subcategory(),
                        Row(
                          children: [
                            Expanded(child: price()),
                            Expanded(child: deliveryPrice()),
                          ],
                        ),
                        description(),
                        tags(),
                        if (Responsive.isMobile(context))
                          Column(children: [fileUpload(), selectedImageList()]),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 3,
                      child:
                          Column(children: [fileUpload(), selectedImageList()]),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          onPublish();
        },
        label: Text(
          'Publish',
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _productNameController,
            decoration: InputDecoration(
              hintText: 'Enter product name.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
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
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          Container(
            width: double.infinity,
            child: DropdownMenu<String>(
              initialSelection: categoryList.first,
              onSelected: (String? value) {
                setState(() {
                  categoryValue = value!;
                });
              },
              dropdownMenuEntries:
                  categoryList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  subcategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sub Category',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          Container(
            width: double.infinity,
            child: DropdownMenu<String>(
              initialSelection: subCategoryList.first,
              onSelected: (String? value) {
                setState(() {
                  subCategoryValue = value!;
                });
              },
              dropdownMenuEntries: subCategoryList
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          )
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
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter price.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
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
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _descriptionController,
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
          Text(
            'Tags',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalMargin(10),
          // Editable Text Field
          Container(
            width: double.infinity,
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
                children: availableTags.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: selectedTags.contains(filter),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedTags.add(filter);
                          } else {
                            selectedTags.remove(filter);
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
          child: SizedBox(
            width: double.infinity, // Adjust the width as needed
            height: 150, // Adjust the height as needed
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
                    style: GoogleFonts.lato(
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
    if (selectedImages != null) {
      return Wrap(
        spacing: 10.0,
        children: selectedImages!.asMap().entries.map((entry) {
          final index = entry.key;
          final imageFile = entry.value;
          return Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                kIsWeb
                    ? Image.network(
                        imageFile.path,
                        width: 100,
                        height: 100,
                      )
                    : Image.file(
                        File(imageFile.path),
                        width: 100,
                        height: 100,
                      ),
                HorizontalMargin(10),
                Text(imageFile.name),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    onDelete(index);
                  },
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return Container();
    }
  }

  deliveryPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Amount',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalMargin(10),
          // Editable Text Field
          TextField(
            controller: _deliveryAmountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter delivery amount.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onDelete(int index) {
    selectedImages?.removeAt(index);
    setState(() {});
  }

  void onPublish() {
    isValidate.value = true;
    print("product name:" + _productNameController.text);
    print("product price:" + _priceController.text);
    print("product delivery amount:" + _deliveryAmountController.text);
    print("product desc:" + _descriptionController.text);
    print("product category:" + categoryValue);
    print("product sub category:" + subCategoryValue);

    for (var item in selectedTags) {
      print("product tags:" + item);
    }

    for (var item in selectedImages!) {
      _uploadImage(item);
      print("product image:" + item.name);
    }

    // for(var item in  selectedImages!){
    //   print("product tags:" + selectedImages?.first.name);
    // }
    // selectedTags.map((tag) => {);
    // selectedImages?.map((image) => {print("product image:" + image.name)});
    // context.read<LoginBloc>().add(LoginUser(
    //     phoneNumber: _phoneNumberController.text,
    //     password: _passwordController.text));
  }

  bool _isUploading = false;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _uploadImage(XFile item) async {
    setState(() {
      _isUploading = true;
    });

    if (item == null) {
      setState(() {
        _isUploading = false;
      });
      return;
    }

    try {
      final storageRef =
          _storage.ref('images/${DateTime.now().millisecond}.jpg');
      final Uint8List imageBytes = await item.readAsBytes();

      final uploadTask = storageRef.putData(imageBytes);

      await uploadTask.whenComplete(() async {
        setState(() {
          _isUploading = false;
        });

        final downloadURL = await storageRef.getDownloadURL();
        print("downloadable link " + downloadURL);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded successfully.' + downloadURL),
          ),
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error uploading image: $error'),
      ));
    }
  }
}
