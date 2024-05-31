import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/login/login_response.dart';
import '../../domain/repositories/provider_repo.dart';
import '../bloc/provider/provider_bloc.dart';

import 'package:image_picker/image_picker.dart';

class AccountBlocProvider extends StatelessWidget {
  final Widget child;

  const AccountBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderBloc(
        providerRepo: GetIt.instance<ProviderRepo>(),
      )..add(const GetProviderDetail()),
      child: child,
    );
  }
}

class AccountDetail extends StatefulWidget {
  const AccountDetail({super.key});

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactPhoneController = TextEditingController();
  XFile? _bannerImage;
  bool _isImageChanged = false;
  Provider? _provider; // State variable to store provider details

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onProviderDetail: (provider) {
                  _provider = provider; // Update state variable
                  _initializeControllers(provider);
                  return detailView(provider, isMobile);
                },
                onProviderDetailError: (message) {
                  return Center(
                    child: Text(message),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: _saveDetails,
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }

  void _initializeControllers(Provider provider) {
    _companyNameController.text = _companyNameController.text.isEmpty
        ? provider.companyName!
        : _companyNameController.text;
    _emailController.text =
        _emailController.text.isEmpty ? provider.email! : _emailController.text;
    _phoneController.text =
        _phoneController.text.isEmpty ? provider.phone! : _phoneController.text;
    _placeController.text =
        _placeController.text.isEmpty ? provider.place! : _placeController.text;
    _contactNameController.text = _contactNameController.text.isEmpty
        ? provider.contactPerson.name
        : _contactNameController.text;
    _contactPhoneController.text = _contactPhoneController.text.isEmpty
        ? provider.contactPerson.phoneNumber
        : _contactPhoneController.text;
  }

  Widget _buildEditableDetailRow(
      String label, TextEditingController controller, bool isEnabled) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: TextField(
        controller: controller,
        enabled: isEnabled,
        decoration: InputDecoration(
          hintText: 'Enter $label',
        ),
      ),
    );
  }

  Widget _buildContactPersonDetail() {
    return ListTile(
      title: const Text(
        'Contact Person',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _contactNameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: _contactPhoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker(Provider provider) {
    final hasBannerImage =
        _bannerImage != null || provider.bannerImageUrl != null;
    final imageUrl = _bannerImage?.path ?? provider.bannerImageUrl;

    return ListTile(
      title: const Text(
        'Company Banner',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasBannerImage)
            Column(
              children: [
                if (kIsWeb)
                  Image.network(
                    imageUrl!,
                    height: 200,
                    width: 350,
                    fit: BoxFit.cover,
                  )
                else
                  Image.file(
                    File(imageUrl!),
                    height: 200,
                    width: 350,
                    fit: BoxFit.cover,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: _pickBannerImage,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Change Image'),
                    ),
                  ),
                ),
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: _pickBannerImage,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add Banner Image'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickBannerImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _bannerImage = pickedFile;
        _isImageChanged = true;
      });
    }
  }

  void _saveDetails() {
    final companyName = _companyNameController.text.toString();
    final placeName = _placeController.text.toString();
    final contactName = _contactNameController.text.toString();
    final contactNumber = _contactPhoneController.text.toString();

    // Check if the image was changed
    if (_isImageChanged) {
      final newImageFile = _bannerImage;
      // Handle saving the new image along with other details
      // You can also pass provider.bannerImageUrl if needed
      var req = UpdateProviderDetail(
          companyName: companyName,
          placeName: placeName,
          contactName: contactName,
          contactNumber: contactNumber,
          isImageChanged: true,
          file: newImageFile);
      context.read<ProviderBloc>().add(req);
    } else {
      // Handle saving other details without changing the image
      var req = UpdateProviderDetail(
          companyName: companyName,
          placeName: placeName,
          contactName: contactName,
          contactNumber: contactNumber,
          bannerImageUrl: _provider?.bannerImageUrl,
          isImageChanged: false);
      context.read<ProviderBloc>().add(req);
    }
  }

  Widget detailView(Provider provider, bool isMobile) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildEditableDetailRow(
                      "Company Name", _companyNameController, true),
                  _buildEditableDetailRow("Email", _emailController, false),
                  _buildEditableDetailRow("Phone", _phoneController, false),
                  _buildEditableDetailRow("Place", _placeController, true),
                  if (isMobile) _buildContactPersonDetail(),
                  _buildImagePicker(provider),
                ],
              ),
            ),
          ),
          if (!isMobile)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildContactPersonDetail(),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _placeController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    super.dispose();
  }
}
