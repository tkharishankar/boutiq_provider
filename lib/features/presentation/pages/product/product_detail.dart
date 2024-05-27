import 'dart:io';

import 'package:boutiq_provider/core/common/button/buttons.dart';
import 'package:boutiq_provider/core/utils/size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/themes/color_scheme.dart';
import '../../../../core/utils/app_texts.dart';
import '../../../../core/utils/input_validation.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../core/utils/responsive.dart';
import '../../../data/models/product/product_resp.dart';
import '../../bloc/product/product_bloc.dart';
import '../../widgets/app_dialog.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({super.key, required this.productId});

  final String productId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddNewProductState();
  }
}

class _AddNewProductState extends ConsumerState<ProductDetail>
    with LoadingOverlayMixin, SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _formSizeKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productIdentifierController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? selectedImages;
  List<ProductSize> productSizeList = [];

  final TextEditingController _sizeNameController = TextEditingController();
  final TextEditingController _sizeWeightController = TextEditingController();
  final TextEditingController _sizeQuantityController = TextEditingController();
  final TextEditingController _sizePriceController = TextEditingController();

  late TabController _tabController;
  int? _editingIndex;
  bool _detailsPopulated = false; // Flag to track initialization
  bool _isLoading = false; // Flag to track loading state
  double oneThirdScreenWidth = 0;
  String productId = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadProductDetails();
  }

  @override
  void didUpdateWidget(covariant ProductDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productId != widget.productId) {
      _loadProductDetails();
    }
  }

  void _loadProductDetails() {
    if (widget.productId.isNotEmpty && widget.productId != "XXX") {
      setState(() {
        _isLoading = true; // Set loading state
        productId = widget.productId;
      });
      context
          .read<ProductBloc>()
          .add(GetProductDetail(productId: widget.productId));
    } else {
      setState(() {
        productId = widget.productId;
      });
      clearProductDetail();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _productNameController.dispose();
    _productIdentifierController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _sizeNameController.dispose();
    _sizeQuantityController.dispose();
    _sizePriceController.dispose();
    _sizeWeightController.dispose();
    super.dispose();
  }

  void clearProductDetail() {
    setState(() {
      _productNameController.clear();
      _productIdentifierController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _detailsPopulated = false; // Reset the flag when clearing details
      _isLoading = false;
    });
  }

  void _populateProductDetails(ProductDetailResp resp) {
    if (!_detailsPopulated) {
      // Check if the details have already been populated
      setState(() {
        productId = resp.product.productId;
        _productNameController.text = resp.product.name;
        _productIdentifierController.text = resp.product.category;
        _priceController.text = resp.product.price;
        _descriptionController.text = resp.product.description;
        productSizeList = List.from(resp.productSize);
        _detailsPopulated = true; // Set the flag after populating details
        _isLoading = false;
        _clearFormFields();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    double screenWidth = MediaQuery.of(context).size.width;
    oneThirdScreenWidth = screenWidth / 3;
    return WillPopScope(
      onWillPop: () async {
        bool shouldLeave = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Do you really want to go back?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  clearProductDetail();
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return shouldLeave;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            productId == "XXX"
                ? "Add New Product"
                : "Product Detail - $productId",
            style: GoogleFonts.lato(),
          ),
        ),
        body: Stack(
          children: [
            _buildForm(isMobile),
            BlocListener<ProductBloc, ProductState>(
              listener: _listener,
              child: Container(),
            ),
            if (_isLoading) // Show loading indicator if loading
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(bool isMobile) {
    return SafeArea(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Product Detail'),
              Tab(text: 'Variant & Quantity'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTab1(isMobile),
                _buildTab2(isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab1(bool isMobile) {
    return Stack(
      children: [
        SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: isMobile ? 1 : 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildProductNameField(),
                              _buildProductIdentifierField(),
                              _buildDescriptionField(),
                              if (isMobile) fileUpload(),
                              if (isMobile) selectedImageList(),
                            ],
                          ),
                        ),
                        if (!isMobile)
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fileUpload(),
                                selectedImageList(),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )),
        Positioned(
          left: isMobile ? 20 : oneThirdScreenWidth,
          right: isMobile ? 20 : oneThirdScreenWidth,
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AppButton(
              text: AppTexts.save,
              onTap: () {
                onAddProductDetail(context);
              },
              textSize: 18,
              textColor: AppColors.white100,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  void onAddProductDetail(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (selectedImages == null || selectedImages!.isEmpty) {
        showAlertDialog(context, "Product Image Missing",
            "Please select the product images.");
        return;
      }
      if (selectedImages!.length > 3) {
        showAlertDialog(context, "Product Image Restriction",
            "You are allowed to add up to 3 images per product.");
        return;
      }

      var req = AddProduct(
        name: _productNameController.text,
        identifier: _productIdentifierController.text,
        price: _priceController.text,
        description: _descriptionController.text,
        images: selectedImages!,
        imageStorageUrl: [],
      );

      context.read<ProductBloc>().add(req);
    }
    return;
  }

  void _listener(BuildContext context, ProductState state) {
    state.maybeWhen(orElse: () {
      _overlayEntry?.remove();
    }, onProductDetail: (product) {
      _populateProductDetails(product);
    }, onProductDetailError: (message) {
      setState(() {
        _isLoading = false; // Set loading state to false if there's an error
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
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
            onTap: () {},
          ),
        ],
      );
    });
  }

  Widget _buildTab2(bool isMobile) {
    return Stack(children: [
      SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Align children to the top
          children: [
            Expanded(
              flex: isMobile ? 1 : 2, // Adjust flex based on device
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productSizeView(),
                  if (isMobile) productSizeListView(),
                ],
              ),
            ),
            if (!isMobile)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productSizeListView(),
                  ],
                ),
              ),
          ],
        ),
      ),
      Positioned(
        left: isMobile ? 20 : oneThirdScreenWidth,
        right: isMobile ? 20 : oneThirdScreenWidth,
        bottom: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppButton(
            text: AppTexts.save,
            onTap: () {
              onAddProductSizes(context);
            },
            textSize: 18,
            textColor: AppColors.white100,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    ]);
  }

  void onAddProductSizes(BuildContext context) {
    if (productSizeList.isEmpty) {
      showAlertDialog(context, "Warning!", "Please add product sizes");
      return;
    }
    if (productSizeList.length > 5) {
      showAlertDialog(context, "Product Size Restriction",
          "You are allowed to add up to 5 sizes per product");
      return;
    }

    var req = AddProductSize(
      productId: productId,
      productSizes: productSizeList,
    );

    context.read<ProductBloc>().add(req);
    return;
  }

  Widget _buildProductNameField() {
    return _buildTextField(
      controller: _productNameController,
      label: 'Product Name',
      hint: 'Enter product name.',
      validator: _productNameValidator,
    );
  }

  Widget _buildProductIdentifierField() {
    return _buildTextField(
      controller: _productIdentifierController,
      label: 'Product Identifier',
      hint: 'Enter product identifier.',
      validator: _productIdentifierValidator,
    );
  }

  Widget _buildDescriptionField() {
    return _buildTextField(
      controller: _descriptionController,
      label: 'Description',
      hint: 'Enter description.',
      validator: descriptionValidator,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }

  String? _productNameValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }

  String? _productIdentifierValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 3) {
      return 'Too short';
    }
    return null;
  }

  String? priceValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
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
      return Container(
        height: 200.0,
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            'Please select the product images',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
  }

  void onDelete(int index) {
    selectedImages?.removeAt(index);
    setState(() {});
  }

  openImages() async {
    try {
      var selectedFiles =
          await imagePicker.pickMultiImage(requestFullMetadata: true);
      Set<XFile> uniqueImages = {...?selectedImages, ...selectedFiles};
      selectedImages = uniqueImages.toList();
      setState(() {});
    } catch (e) {
    }
  }

  Widget productSizeListView() {
    if (productSizeList.isEmpty) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        borderRadius: BorderRadius.circular(4),
      ),
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
                    'Weight(g)',
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
          const Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
          Column(
            children: productSizeList.asMap().entries.map((entry) {
              int index = entry.key;
              ProductSize productSize = entry.value;
              return Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        productSize.productSize,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        productSize.quantity.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        productSize.weight.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        productSize.price.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => editProductSize(index),
                        child: const Text(
                          'Edit',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => deleteProductSize(index),
                        child: const Text(
                          'Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void editProductSize(int index) {
    final productSize = productSizeList[index];
    _editingIndex = index;
    _sizeNameController.text = productSize.productSize;
    _sizeQuantityController.text = productSize.quantity.toString();
    _sizePriceController.text = productSize.price.toString();
    _clearFormFields();
  }

  void deleteProductSize(int index) {
    showCustomDialog(
      context,
      'Confirm Deletion',
      'Are you sure you want to delete this item?',
      () {
        setState(() {
          productSizeList = List<ProductSize>.from(productSizeList);
          productSizeList.removeAt(index);
          _editingIndex = null;
        });
      },
      confirmText: 'Delete',
      cancelText: 'Cancel',
    );
  }

  String? sizeNameValidator(text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  bool isDuplicateSizeName(String sizeName) {
    return productSizeList.any((productSize) =>
        productSize.productSize.toLowerCase() == sizeName.toLowerCase());
  }

  Widget productSizeView() {
    return SafeArea(
      child: Form(
        key: _formSizeKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: _buildFormField(
                label: 'Size Name',
                controller: _sizeNameController,
                hintText: 'Enter size name',
                validator: sizeNameValidator,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: _buildFormField(
                      label: 'Quantity',
                      controller: _sizeQuantityController,
                      hintText: 'Enter total quantity',
                      validator: priceValidator,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: _buildFormField(
                      label: 'Price',
                      controller: _sizePriceController,
                      hintText: 'Enter per quantity price',
                      validator: priceValidator,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: _buildFormField(
                label: 'Actual Weight (in Grams)',
                controller: _sizeWeightController,
                hintText: 'Enter weight',
                validator: sizeNameValidator,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                width: 200,
                child: AppButton(
                  text: _editingIndex == null
                      ? AppTexts.add
                      : AppTexts.updateSize,
                  onTap: _editingIndex == null
                      ? _addOrUpdateSize
                      : _addOrUpdateSize,
                  textSize: 18,
                  textColor: AppColors.white100,
                  color: AppColors.primaryColor.withAlpha(150),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Function to add or update size
  void _addOrUpdateSize() {
    if (_formSizeKey.currentState!.validate()) {
      if (_editingIndex == null) {
        _addNewSize();
      } else {
        _updateExistingSize();
      }
    }
  }

// Function to add a new size
  void _addNewSize() {
    if (isDuplicateSizeName(_sizeNameController.text)) {
      _showDuplicateNameDialog();
    } else {
      final int quantity = int.parse(_sizeQuantityController.text);
      final double price = double.parse(_sizePriceController.text);
      final int weight = int.parse(_sizeWeightController.text);
      setState(() {
        productSizeList = List.from(productSizeList)
          ..add(ProductSize(
              productSize: _sizeNameController.text,
              price: price,
              quantity: quantity,
              weight: weight));
        _editingIndex = null;
      });
    }
  }

// Function to update an existing size
  void _updateExistingSize() {
    final existingIndex = productSizeList.indexWhere((productSize) =>
        productSize.productSize.toLowerCase() ==
            _sizeNameController.text.toLowerCase() &&
        productSize != productSizeList[_editingIndex!]);
    if (existingIndex != -1) {
      _showDuplicateNameDialog();
    } else {
      final int quantity = int.parse(_sizeQuantityController.text);
      final double price = double.parse(_sizePriceController.text);
      setState(() {
        productSizeList = List.from(productSizeList)
          ..[(_editingIndex ?? 0)] = ProductSize(
            productSize: _sizeNameController.text,
            price: price,
            quantity: quantity,
          );
        _editingIndex = null;
      });
    }
  }

// Function to show a dialog for duplicate size name
  void _showDuplicateNameDialog() {
    showCustomDialog(
      context,
      'Duplicate Size Name',
      'The size name already exists. Please enter a different size name.',
      () {},
      confirmText: 'OK',
    );
  }

// Function to clear form fields
  void _clearFormFields() {
    setState(() {});
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }

  descriptionDetail() {
    return Container();
  }
}
