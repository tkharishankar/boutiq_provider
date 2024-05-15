import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/login/login_response.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  // Initialize variables to store user details
  String? _companyName = "Company XYZ";
  String? _email = "user@example.com";
  String? _phone = "1234567890";
  String? _place = "New York";
  String? _password = "password123";
  ProviderStatus? _status = ProviderStatus.ACTIVE;

  final ContactPersonDetail _contactPerson = ContactPersonDetail(
    name: "John Doe",
    phoneNumber: "9876543210",
  );

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDetailRow("Company Name", _companyName),
                _buildDetailRow("Email", _email),
                _buildDetailRow("Phone", _phone),
                _buildDetailRow("Place", _place),
                _buildDetailRow("Password", _password),
                _buildDetailRow("Status", _status.toString().split('.').last),
                if (isMobile) _buildContactPersonDetail(_contactPerson),
              ],
            ),
          ),
        ),
        if (!isMobile)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildContactPersonDetail(_contactPerson),
            ),
          ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value ?? ''),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          print('Editing $label');
        },
      ),
    );
  }

  Widget _buildContactPersonDetail(ContactPersonDetail contactPerson) {
    return ListTile(
      title: const Text(
        'Contact Person',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Name: '),
              Text(contactPerson.name),
            ],
          ),
          Row(
            children: [
              const Text('Phone Number: '),
              Text(contactPerson.phoneNumber),
            ],
          ),
        ],
      ),
    );
  }
}
