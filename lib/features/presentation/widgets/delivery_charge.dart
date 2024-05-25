import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/responsive.dart';
import '../../data/models/deliverycharge/delivery_charge.dart';
import '../bloc/deliverycharge/region_bloc.dart';

class DeliveryChargeView extends StatefulWidget {
  @override
  _DeliveryChargeViewState createState() => _DeliveryChargeViewState();
}

class _DeliveryChargeViewState extends State<DeliveryChargeView> {
  Region? selectedRegion;

  @override
  void initState() {
    super.initState();
    context.read<RegionBloc>().add(FetchRegions());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegionBloc, RegionState>(
      listener: (context, state) {
        if (state is RegionStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is RegionStateLoaded) {
          // Update the selectedRegion when new regions are loaded
          setState(() {
            selectedRegion =
                state.regions.isNotEmpty ? state.regions.first : null;
          });
        }
      },
      child: BlocBuilder<RegionBloc, RegionState>(
        builder: (context, state) {
          if (state is RegionStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RegionStateLoaded) {
            return Responsive.isMobile(context)
                ? buildMobileLayout(state.regions)
                : buildDesktopLayout(state.regions);
          } else if (state is RegionStateError) {
            return const Center(child: Text('Failed to load regions'));
          }
          return Container();
        },
      ),
    );
  }

  Widget buildMobileLayout(List<Region> regions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Your Service Regions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: regions.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        RegionDetailView(region: regions[index]),
                  );
                },
                child: RegionCard(region: regions[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildDesktopLayout(List<Region> regions) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Your Service Regions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: regions.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedRegion = regions[index];
                        });
                      },
                      child: RegionCard(region: regions[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: selectedRegion != null
              ? RegionDetailView(region: selectedRegion!)
              : const Center(child: Text('Select a region to view details')),
        ),
      ],
    );
  }
}

class RegionCard extends StatelessWidget {
  final Region region;

  RegionCard({required this.region});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(region.name),
      ),
    );
  }
}

class RegionDetailView extends StatelessWidget {
  final Region region;

  RegionDetailView({required this.region});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Region Name: ${region.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Countries:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            ...region.countries.map((country) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                child: Row(
                  children: [
                    Icon(Icons.flag, size: 16, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('${country.name} (${country.code})'),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 16),
            Text(
              'Delivery Charges:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text('Base Charge: \$${region.baseCharge}'),
                  backgroundColor: Colors.green.withOpacity(0.1),
                ),
                Chip(
                  label:
                      Text('Additional Charge: \$${region.additionalCharge}'),
                  backgroundColor: Colors.red.withOpacity(0.1),
                ),
              ],
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _editDeliveryCharges(context, region);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Edit Delivery Charges',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _editDeliveryCharges(BuildContext context, Region region) {
  final TextEditingController baseChargeController =
      TextEditingController(text: region.baseCharge.toString());
  final TextEditingController additionalChargeController =
      TextEditingController(text: region.additionalCharge.toString());

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Delivery Charges'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: baseChargeController,
              decoration: const InputDecoration(labelText: 'Base Charge'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: additionalChargeController,
              decoration: const InputDecoration(labelText: 'Additional Charge'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final baseCharge =
                  int.tryParse(baseChargeController.text) ?? region.baseCharge;
              final additionalCharge =
                  int.tryParse(additionalChargeController.text) ??
                      region.additionalCharge;
              context.read<RegionBloc>().add(
                    UpdateDeliveryCharges(
                      deliveryChargeReq: DeliveryChargeReq(
                        regionId: region.name,
                        base: baseCharge,
                        additional: additionalCharge,
                      ),
                    ),
                  );
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
