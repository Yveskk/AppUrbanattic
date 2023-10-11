import 'package:flutter/material.dart';
import 'components/archiver.dart';
import 'components/terminer.dart';
import 'components/enCours.dart';

class RechercheService extends StatefulWidget {
  const RechercheService({Key? key}) : super(key: key);

  @override
  _KitchenShareState createState() => _KitchenShareState();
}

class _KitchenShareState extends State<RechercheService>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            'Proposer un terrain', 
            style: TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.bold, 
            ),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'En cours'),
              Tab(text: 'Terminer'),
              Tab(text: 'Archiver'),
            ],
            onTap: (index) {
              setState(() {
              });
            },
            controller: _tabController,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Encours(),
          Terminer(),
          Archiver(),
        ],
      ),
    );
  }
}
