import 'package:elearn/models/course_model.dart';
import 'package:elearn/widgets/video_thumbnail_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List<CourseModel> courses = [
    CourseModel(
      'Android Development',
      'Mobile devices and smartphones have become increasingly popular and important. They have completely transformed the way we do business today.',
      '12 hours',
    ),
    CourseModel(
      'iOS Development',
      'IOS Developers design and build applications for mobile devices running Apple’s iOS operating software.',
      '10 hours',
    ),
    CourseModel(
      'Web Development',
      'Web development is the work involved in developing a Web site for the Internet. We believe in designing a user-friendly website to beat the industry standard.',
      '15 hours',
    ),
    CourseModel(
      'Software Development',
      'Software development refers to a set of computer science activities dedicated to the process of creating, designing, deploying and supporting software.',
      '14 hours',
    ),
    CourseModel(
      'E-Commerce Development',
      'E-commerce (electronic commerce) is the activity of electronically buying or selling products on online services or over the Internet.',
      '14 hours',
    ),
    CourseModel(
      'Digital Marketing',
      'Digital marketing is the component of marketing that utilizes internet and online based digital technologies.',
      '14 hours',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text('eLearn'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 0,
                child: const Icon(Icons.notifications_outlined),
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              // CHange with Person Image
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.easeInOut,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 0.9,
              ),
              items: courses.map((course) {
                return Builder(
                  builder: (BuildContext context) {
                    return CourseCard(
                      title: course.courseName,
                      description: course.description,
                      duration: course.duration,
                    );
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Videos Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Videos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
                children: List.generate(
              1,
              (index) => VideoPlayerApp(
                course: courses[0],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;

  const CourseCard({
    Key? key,
    required this.title,
    required this.description,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color(0xFFEFE7D4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Duration: $duration',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color(0xFF9E9D89),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
