import 'package:flutter/material.dart';
import 'component s/archive.dart';
import 'component s/enCours.dart';

class KitchenShare extends StatefulWidget {
  const KitchenShare({Key? key}) : super(key: key);

  @override
  _KitchenShareState createState() => _KitchenShareState();
}

class _KitchenShareState extends State<KitchenShare>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Cuisine Partagée',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: ' En cours'),
              Tab(text: 'Archives'),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _tabController,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Encour(),
          Archive(),
        ],
      ),
    );
  }
}
