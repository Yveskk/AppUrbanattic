import 'package:flutter/material.dart';

import 'components/offres.dart';
import 'components/subjection.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _KitchenShareState createState() => _KitchenShareState();
}

class _KitchenShareState extends State<NotificationPage>
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
            'Kitchen Share', 
            style: TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.bold, 
            ),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Subjections'),
              Tab(text: 'Offres'),
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
          Subjection(),
          Offres(),
        ],
      ),
    );
  }
}
