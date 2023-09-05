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
    'Cloths',
    'Accessories',
    'Care',
  ];

  List<String> categoryList = <String>['Men', 'Women', "Baby"];
  String categoryValue = "";
  List<String> subCategoryList = <String>[
    'Top Wear',
    'Bottom Wear',
    'Foot Wear',
    'Inner Wear',
    'Bath Care',
    'Face Care',
    'Hair Care',
    'Body & Skin Care',
  ];
  String subCategoryValue = "";
  List<String> subCategoryTypeList = <String>[
    'Top Wear',
    'Bottom Wear',
    'Foot Wear',
    'Inner Wear',
    'Bath Care',
    'Face Care',
    'Hair Care',
    'Body & Skin Care',
  ];
  String subCategoryTypeValue = "";

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
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product', style: GoogleFonts.lato()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isMobile ? 3 : 6, // Adjust flex based on device
                    child: Column(
                      children: [
                        productName(),
                        if (!isMobile)
                          Row(
                            children: [
                              Expanded(child: category()),
                              Expanded(child: subcategory()),
                              Expanded(child: subcategorytype()),
                            ],
                          ),
                        if (isMobile) category(),
                        if (isMobile) subcategory(),
                        if (isMobile) subcategorytype(),
                        if (!isMobile)
                          Row(
                            children: [
                              Expanded(child: price()),
                              Expanded(child: deliveryPrice()),
                            ],
                          ),
                        if (isMobile) price(),
                        if (isMobile) deliveryPrice(),
                        description(),
                        tags(),
                        if (isMobile) fileUpload(),
                        if (isMobile) selectedImageList(),
                      ],
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          fileUpload(),
                          selectedImageList(),
                        ],
                      ),
                    ),
                ],
              ),
              // Render only on mobile
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onPublish,
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

  Widget productName() {
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
          SizedBox(height: 10),
          // Editable Text Field
          TextField(
            controller: _productNameController,
            decoration: InputDecoration(
              hintText: 'Enter product name.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
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

  Widget category() {
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
          SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
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

  Widget subcategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sub Category',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
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
          ),
        ],
      ),
    );
  }

  Widget subcategorytype() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type, Brand or Product',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
          Container(
            width: double.infinity,
            child: DropdownMenu<String>(
              initialSelection: subCategoryTypeList.first,
              onSelected: (String? value) {
                setState(() {
                  subCategoryValue = value!;
                });
              },
              dropdownMenuEntries: subCategoryTypeList
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget price() {
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
          SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter price.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
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

  Widget description() {
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
          SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: 'Enter description about the product.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
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

  Widget tags() {
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
          SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.shade500,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 8,
                children: availableTags.map((filter) {
                  return FilterChip(
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
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

  Widget fileUpload() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: InkWell(
        onTap: openImages,
        child: Container(
          width: double.infinity, // Adjust the width as needed
          height: 150, // Adjust the height as needed
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue, // Customize the border color
              width: 2, // Adjust the border thickness
            ),
            borderRadius: BorderRadius.circular(15), // Adjust the border radius
          ),
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
              borderRadius: BorderRadius.circular(4),
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
                borderRadius: BorderRadius.circular(4),
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
