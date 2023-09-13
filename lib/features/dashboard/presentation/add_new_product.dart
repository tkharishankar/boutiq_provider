import 'dart:convert';
import 'dart:io';

import 'package:boutiq_provider/core/utils/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/themes/color_scheme.dart';
import '../../../core/utils/input_validation.dart';
import '../../../core/utils/loading_overlay.dart';
import '../../../core/utils/responsive.dart';
import '../../../router/router.dart';
import 'states/product_bloc.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddNewProductState();
  }
}

class _AddNewProductState extends ConsumerState<AddNewProduct>
    with LoadingOverlayMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final TextEditingController _productNameController = TextEditingController();
  String _productName = "";
  final TextEditingController _productIdentifierController =
      TextEditingController();
  String _productIdentifier = "";
  final TextEditingController _priceController = TextEditingController();
  String _price = "";
  final TextEditingController _deliveryAmountController =
      TextEditingController();
  String _deliveryAmount = "";
  final TextEditingController _descriptionController = TextEditingController();
  String _description = "";
  var subCategoryTypeError;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? selectedImages;
  List<String> selectedTags = [];
  List<String> availableTags = [
    'Cloths',
    'Accessories',
    'Care',
  ];

  String categoryValue = "";
  String subCategoryValue = "";
  String subCategoryItemValue = "";

  static const jsonString = '''{
  "Men": {
    "Top Wear": [
      "T-Shirts",
      "Shirts",
      "Sweaters",
      "Hoodies",
      "Jackets",
      "Polos",
      "Vests",
      "Long Sleeve Tops"
    ],
    "Bottom Wear": [
      "Jeans",
      "Trousers",
      "Shorts",
      "Cargo Pants",
      "Sweatpants",
      "Chinos"
    ],
    "Foot Wear": [
      "Sneakers",
      "Boots",
      "Loafers",
      "Oxfords",
      "Athletic Shoes"
    ],
    "Inner Wear": [
      "Boxers",
      "Briefs",
      "Thermal Underwear",
      "Socks"
    ]
  },
  "Women": {
    "Top Wear": [
      "T-Shirts",
      "Blouses",
      "Tank Tops",
      "Sweaters",
      "Hoodies",
      "Jackets",
      "Cardigans",
      "Polos",
      "Tunics",
      "Sweatshirts",
      "Kimonos",
      "Crop Tops",
      "Peplum Tops",
      "Off-Shoulder Tops",
      "Halter Tops",
      "Button-Down Tops",
      "Camisoles",
      "Turtlenecks",
      "Long Sleeve Tops",
      "Sleeveless Tops"
    ],
    "Bottom Wear": [
      "Jeans",
      "Trousers",
      "Shorts",
      "Skirts",
      "Leggings",
      "Capri Pants",
      "Culottes",
      "Jeggings",
      "Cargo Pants",
      "Sweatpants",
      "Palazzo Pants",
      "Track Pants",
      "Chinos",
      "Overalls",
      "Bermuda Shorts",
      "Flare Pants",
      "High-Waisted Pants",
      "Wide-Leg Pants",
      "Pencil Skirts",
      "Maxi Skirts",
      "Mini Skirts",
      "A-Line Skirts"
    ],
    "Foot Wear": [
      "Sneakers",
      "Boots",
      "Sandals",
      "Flip-Flops",
      "Heels",
      "Flats",
      "Loafers",
      "Espadrilles",
      "Oxfords",
      "Wedges",
      "Mules",
      "Slippers",
      "Platform Shoes",
      "Ballet Flats",
      "Driving Shoes"
    ],
    "Inner Wear": [
      "Bras",
      "Panties",
      "Lingerie Sets",
      "Shapewear",
      "Camisoles",
      "Sleepwear",
      "Socks",
      "Tights"
    ]
  },
  "Baby": {
    "Foot Wear": [
      "Baby Shoes",
      "Baby Socks"
    ],
    "Bath Care": [
      "Baby Shampoo",
      "Baby Soap",
      "Baby Lotion"
    ],
    "Face Care": [
      "Baby Face Cream"
    ],
    "Hair Care": [
      "Baby Shampoo"
    ],
    "Body & Skin Care": [
      "Baby Body Lotion",
      "Baby Oil",
      "Baby Powder",
      "Baby Cream"
    ],
    "Accessories": [
      "Baby Hats",
      "Baby Mittens",
      "Baby Bibs"
    ]
  }
}''';

  final Map<String, dynamic> categories = json.decode(jsonString);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          child: Form(
            key: _formKey,
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
                          productIdentifier(),
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
      ),
      floatingActionButton: BlocConsumer<ProductBloc, ProductState>(
        listener: _listener,
        builder: (context, state) {
          return Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: FloatingActionButton.extended(
              onPressed: () {
                onPublish(context);
              },
              label: Text(
                'Publish',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget productName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          TextFormField(
            controller: _productNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            validator: productNameValidator,
            onChanged: (text) => setState(() => _productName = text),
          ),
        ],
      ),
    );
  }

  productIdentifier() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Identifier',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Editable Text Field
          TextFormField(
            controller: _productIdentifierController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: 'Enter product color/shade/code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            validator: productIdentifierValidator,
            onChanged: (text) => setState(() => _productIdentifier = text),
          ),
        ],
      ),
    );
  }

  String? productIdentifierValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 3) {
      return 'Too short';
    }
    return null;
  }

  String? productNameValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
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
          const SizedBox(height: 10), // Replaced VerticalMargin with SizedBox
          Container(
            width: double.infinity,
            child: DropdownMenu<String>(
              hintText: "Please select",
              onSelected: (String? value) {
                setState(() {
                  categoryValue = value!;
                  subCategoryValue = "";
                  subCategoryItemValue = "";
                });
              },
              dropdownMenuEntries: categories.keys
                  .map<DropdownMenuEntry<String>>((String value) {
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
              hintText: "Please select",
              onSelected: (String? value) {
                setState(() {
                  subCategoryValue = value!;
                  subCategoryItemValue = "";
                });
              },
              dropdownMenuEntries: categoryValue.isNotEmpty
                  ? categories[categoryValue]
                      .keys
                      .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList()
                  : [],
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
              hintText: "Please select",
              errorText: subCategoryTypeError,
              onSelected: (String? value) {
                setState(() {
                  subCategoryItemValue = value!;
                });
              },
              dropdownMenuEntries:
                  categoryValue.isNotEmpty && subCategoryValue.isNotEmpty
                      ? categories[categoryValue][subCategoryValue]
                          .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList()
                      : [],
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
          TextFormField(
            controller: _priceController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
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
            validator: priceValidator,
            onChanged: (text) => setState(() => _price = text),
          ),
        ],
      ),
    );
  }

  String? priceValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
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
          TextFormField(
            controller: _deliveryAmountController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
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
            validator: priceValidator,
            onChanged: (text) => setState(() => _deliveryAmount = text),
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
          TextFormField(
            controller: _descriptionController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            validator: descriptionValidator,
            onChanged: (text) => setState(() => _description = text),
          ),
        ],
      ),
    );
  }

  String? descriptionValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 10) {
      return 'must be at least 10 character';
    }
    return null;
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

  void onDelete(int index) {
    selectedImages?.removeAt(index);
    setState(() {});
  }

  void onPublish(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (categoryValue.isEmpty ||
          subCategoryItemValue.isEmpty ||
          subCategoryValue.isEmpty) {
        showAlertDialog(context, "Category Missing",
            "You missed to specify something on the category section.");
        return;
      }

      if (selectedTags.isEmpty) {
        showAlertDialog(context, "Tags Missing", "Please select the tags.");
        return;
      }

      if (selectedImages == null || selectedImages!.isEmpty) {
        showAlertDialog(context, "Product Image Missing",
            "Please select the product images.");
        return;
      }
      context.read<ProductBloc>().add(
            AddProductReq(
                name: _productName,
                identifier: _productIdentifier,
                price: _price,
                deliveryPrice: _deliveryAmount,
                category: categoryValue,
                subCategory: subCategoryValue,
                subCategoryType: subCategoryItemValue,
                description: _description,
                tags: selectedTags,
                images: selectedImages!),
          );
    }
    return;
  }

  openImages() async {
    try {
      var selectedFiles =
          await imagePicker.pickMultiImage(requestFullMetadata: true);
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

  void _listener(BuildContext context, ProductState state) {
    state.maybeWhen(orElse: () {
      _overlayEntry?.remove();
    }, loading: () {
      _overlayEntry = showLoadingOverlay(context, _overlayEntry);
    }, addProductError: (message) {
      _overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.errorColor,
          duration: const Duration(seconds: 3),
        ),
      );
    }, addProductSuccessful: (message) {
      _overlayEntry = hideLoadingOverlay(context, _overlayEntry);
      showActionAlertDialog(
        context,
        "Product Added successfully.",
        "",
        [
          AlertAction(
            label: 'Ok',
            onTap: () {
              GoRouter.of(context).replaceNamed(RouteConstants.home);
            },
          ),
        ],
      );
    });
  }
}
