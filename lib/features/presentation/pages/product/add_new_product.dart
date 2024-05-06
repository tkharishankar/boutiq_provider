import 'dart:convert';
import 'dart:io';

import 'package:boutiq_provider/core/common/button/buttons.dart';
import 'package:boutiq_provider/core/utils/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/themes/color_scheme.dart';
import '../../../../core/utils/app_texts.dart';
import '../../../../core/utils/input_validation.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../router/router.dart';
import '../../bloc/product/product_bloc.dart';

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
  final GlobalKey<FormState> _formSizeKey = GlobalKey();
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

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? selectedImages;

  List<ProductSize>? productSizeList = [];
  final TextEditingController _sizeNameController = TextEditingController();
  String _sizeName = "";
  final TextEditingController _sizeQuantityController = TextEditingController();
  String _sizeQuantity = "";
  final TextEditingController _sizePriceController = TextEditingController();
  String _sizePrice = "";

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
                      flex: isMobile ? 3 : 3, // Adjust flex based on device
                      child: Column(
                        children: [
                          productName(),
                          productIdentifier(),
                          deliveryPrice(),
                          description(),
                          if (isMobile) productSizeView(),
                          if (isMobile) productSizeListView(),
                          if (isMobile) fileUpload(),
                          if (isMobile) selectedImageList(),
                        ],
                      ),
                    ),
                    if (!isMobile)
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [productSizeView(), productSizeListView()],
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
                description: _description,
                images: selectedImages!),
          );
    }
    return;
  }

  openImages() async {
    try {
      var selectedFiles =
          await imagePicker.pickMultiImage(requestFullMetadata: true);
      Set<XFile> uniqueImages = {...?selectedImages, ...selectedFiles};
      selectedImages = uniqueImages.toList();
      setState(() {});
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

  Widget productSizeListView() {
    if (productSizeList != null && productSizeList!.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Size Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Quantity',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Price',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 10.0,
              children: productSizeList!.asMap().entries.map((entry) {
                final productSize = entry.value;
                return Column(
                  children: [
                    const Divider(
                      // Add a Divider between rows
                      color: Colors.grey, // Set the color of the Divider
                      thickness: 1.0, // Set the thickness of the Divider
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              productSize.sizeName,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              productSize.quantity,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              productSize.price,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Edit',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Delete',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  String? sizeNameValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  productSizeView() {
    return SafeArea(
      child: Form(
        key: _formSizeKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Size Name',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _sizeNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Enter size name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: sizeNameValidator,
                    onChanged: (text) => setState(() => _sizeName = text),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _sizeQuantityController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Enter total quantity',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                          ),
                          validator: priceValidator,
                          onChanged: (text) =>
                              setState(() => _sizeQuantity = text),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
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
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _sizePriceController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Enter per quantity price.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                          ),
                          validator: priceValidator,
                          onChanged: (text) =>
                              setState(() => _sizePrice = text),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: AppButton(
                text: AppTexts.addNewSize,
                onTap: () {
                  if (_formSizeKey.currentState!.validate()) {
                    productSizeList?.add(ProductSize(
                        sizeName: _sizeName,
                        price: _sizePrice,
                        quantity: _sizeQuantity));
                    setState(() {});
                  }
                },
                textSize: 18,
                textColor: AppColors.white100,
                color: AppColors.primaryColor.withAlpha(150),
              ),
            )
          ],
        ),
      ),
    );
  }
}
