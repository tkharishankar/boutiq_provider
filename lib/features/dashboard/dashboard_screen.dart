import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/input_validation.dart';
import '../../core/utils/loading_overlay.dart';
import '../../router/router.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with InputValidationMixin, LoadingOverlayMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  _searchbar(),
                  _addnewproduct(context),
                ],
              ),
              _topsold(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchbar() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SearchBar(
        hintText: 'What you are looking for?',
        leading: const Icon(Icons.search),
        trailing: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              print('Use image search');
            },
          )
        ],
      ),
    );
  }

  SizedBox _topsold() {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(
                  child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(
                  child: Text(
                    'Item 2',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(
                  child: Text(
                    'Item 3',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(
                  child: Text(
                    'Item 4',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(
                  child: Text(
                    'Item 5',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addnewproduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: () {
          GoRouter.of(context)
              .pushNamed(RouteConstants.addnewproduct);
          },
        icon: const Icon(Icons.add, size: 45),
        label: const Text("Add New"),
      ),
    );
  }
}
