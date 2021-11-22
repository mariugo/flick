import 'package:flutter/material.dart';

import '/widgets/tab_indicator.dart';
import '/design_system.dart';

class TabBarChip extends StatelessWidget {
  final TabController controller;
  const TabBarChip({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      unselectedLabelColor: Colors.black,
      labelStyle: DS.genreTextPill,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const TabIndicator(
        backgroundColor: DS.genreSelected,
        height: 24,
      ),
      tabs: const [
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Ação'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Aventura'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Fantasia'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Comédia'),
          ),
        ),
      ],
    );
  }
}

class TabChips extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  final List<String> labels;

  const TabChips({
    Key? key,
    required this.onChanged,
    this.selectedIndex = 0,
    required this.labels,
  }) : super(key: key);

  void _handleTap(int value) {
    onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: labels.map<Widget>(
        (genre) {
          final index = labels.indexOf(genre);
          return ChoiceChip(
            selected: selectedIndex == index,
            label: Text(genre),
            labelStyle: selectedIndex == index
                ? DS.genreTextPill
                : DS.genreTextPill.copyWith(color: Colors.black),
            backgroundColor: Colors.white,
            onSelected: (selected) {
              if (selected) {
                _handleTap(index);
              }
            },
            selectedColor: DS.genreSelected,
          );
        },
      ).toList(),
    );
  }
}
