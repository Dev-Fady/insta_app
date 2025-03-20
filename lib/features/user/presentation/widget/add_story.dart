import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStory extends StatelessWidget {
  const AddStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              child: Icon(Icons.add),
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 5.h),
            Text(
              'Add to Story',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
