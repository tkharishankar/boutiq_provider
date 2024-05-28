import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/login/login_response.dart';
import '../../domain/repositories/provider_repo.dart';
import '../bloc/provider/provider_bloc.dart';



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
                  return detailView(provider,isMobile);
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
        onPressed: () {},
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

  Widget detailView(Provider provider, bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDetailRow("Company Name", provider.companyName),
                _buildDetailRow("Email", provider.email),
                _buildDetailRow("Phone", provider.phone),
                _buildDetailRow("Place", provider.place),
                if (isMobile) _buildContactPersonDetail(provider.contactPerson),
              ],
            ),
          ),
        ),
        if (!isMobile)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildContactPersonDetail(provider.contactPerson),
            ),
          ),
      ],
    );
  }
}
