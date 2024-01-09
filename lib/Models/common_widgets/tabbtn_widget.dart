import 'package:flutter/material.dart';

class ReusableTabWidget extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;

  ReusableTabWidget({required this.tabTitles, required this.tabContents});

  @override
  _ReusableTabWidgetState createState() => _ReusableTabWidgetState();
}

class _ReusableTabWidgetState extends State<ReusableTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: widget.tabTitles
              .map((title) => Tab(text: title))
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabContents,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
