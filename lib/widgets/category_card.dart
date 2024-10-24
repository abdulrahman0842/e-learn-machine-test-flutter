import 'package:elearn/models/course_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CourseModel course;
  const CategoryCard({
    required this.course,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 226, 239),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.courseName,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500),
                ),
                Flexible(
                  child: Text(
                    course.description,
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
