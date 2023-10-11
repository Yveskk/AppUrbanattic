import 'package:flutter/material.dart';

class GridAdaptive extends StatelessWidget {
  final List<Widget> children;

  const GridAdaptive({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    int gridCol = _getNumberOfColumn(context);
    final List<List<Widget>> listColumn = [];
    // create column
    for (int i = 0; i < gridCol; i++) {
      listColumn.add(<Widget>[]);
    }

    //display the children in two columns
    int y = 0;
    while (y < children.length) {
      int x = 0;
      while (x < gridCol) {
        if (y < children.length) {
          listColumn[x].add(
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: children[y++],
            ),
          );
        }
        x++;
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < listColumn.length; i++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: (i == 0) ? 0 : 12),
              child: Column(
                children: listColumn[i],
              ),
            ),
          )
      ],
    );
  }

  int _getNumberOfColumn(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 2;
    } else if (screenWidth > 600 && screenWidth < 800) {
      return 3;
    } else if (screenWidth > 800 && screenWidth < 1024) {
      return 4;
    } else {
      return 5;
    }
  }
}
