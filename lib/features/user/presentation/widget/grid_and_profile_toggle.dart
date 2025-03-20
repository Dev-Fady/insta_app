
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridAndProfileToggle extends StatefulWidget {
  const GridAndProfileToggle({super.key});

  @override
  State<GridAndProfileToggle> createState() => _GridAndProfileToggleState();
}

class _GridAndProfileToggleState extends State<GridAndProfileToggle> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(Icons.grid_on, 0),
              _buildIcon(Icons.person_outline, 1),
            ],
          ),
        ),
        SizedBox(
          height: 200.h,
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, value, child) {
              return Center(
                child: value == 0
                    ? const Text('عرض الجريد')
                    : const Text('عرض الصور الشخصية'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, value, child) {
        return IconButton(
          icon: Icon(icon, color: value == index ? Colors.black : Colors.grey),
          onPressed: () => _selectedIndex.value = index,
        );
      },
    );
  }
}
