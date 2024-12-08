import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Image paths for each section
  final List<String> carouselImages = [
    'assets/images/slide1.png',
    'assets/images/slide2.png',
    'assets/images/slide3.png',
  ];

  final List<String> nowShowingImages = [
    'assets/images/nowshowing1.jpg',
    'assets/images/nowshowing2.jpg',
    'assets/images/nowshowing3.jpg',
  ];

  final List<String> upcomingImages = [
    'assets/images/upcoming1.jpeg',
    'assets/images/upcoming2.webp',
    'assets/images/upcoming3.jpg',
  ];

  final List<String> promotionImages = [
    'assets/images/promotion1.jpg',
    'assets/images/promotion2.jpg',
    'assets/images/promotion3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: 'Malang',
          items: <String>['Malang', 'Jakarta', 'Surabaya'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            // Update city location logic here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.grey),
            onPressed: () {
              // Handle account icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreeting(),
              SizedBox(height: 20),

              // Carousel Section
              _buildCarousel(),
              SizedBox(height: 20),

              // Now Showing Section with Carousel
              _buildNowShowingSection(),
              SizedBox(height: 20),

              // Upcoming Section (portrait 3:5 ratio)
              _buildUpcomingSection(),
              SizedBox(height: 20),

              // Promotion Section (landscape 4:3 ratio)
              _buildPromotionSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Build the greeting text at the top
  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, Guest",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Kamu mau nonton apa hari ini?",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  // Build the carousel
  Widget _buildCarousel() {
    return CarouselSlider(
      items: carouselImages.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
    );
  }

  // Now Showing section with carousel
  Widget _buildNowShowingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Now Showing"),
        SizedBox(height: 10),
        _buildNowShowingCarousel(),
      ],
    );
  }

  // A carousel for the Now Showing section
  Widget _buildNowShowingCarousel() {
    return CarouselSlider(
      items: nowShowingImages.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width *
                  0.45, // 45% of the screen width for portrait ratio
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover, // Portrait images maintain their ratio
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 250, // Adjusted height for portrait images
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 3 / 5, // 3:5 portrait ratio for images
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
    );
  }

  // Upcoming section with 3:5 portrait images
  Widget _buildUpcomingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Upcoming"),
        SizedBox(height: 10),
        _buildUpcomingImages(),
      ],
    );
  }

  // A scrollable horizontal list of images for the Upcoming section with 3:5 portrait images
  Widget _buildUpcomingImages() {
    return SizedBox(
      height: 250, // Adjusted height for portrait images
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: upcomingImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width *
                0.45, // 45% of the screen width for portrait ratio
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                upcomingImages[index],
                fit: BoxFit.cover, // Portrait images maintain their ratio
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Promotion section with 4:3 landscape images
  Widget _buildPromotionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Promotion"),
        SizedBox(height: 10),
        _buildPromotionImages(),
      ],
    );
  }

  // A scrollable horizontal list of images for the Promotion section with 4:3 landscape images
  Widget _buildPromotionImages() {
    return SizedBox(
      height: 200, // Adjusted height for landscape images
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: promotionImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width *
                0.75, // 75% of the screen width for landscape ratio
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                promotionImages[index],
                fit: BoxFit.cover, // Landscape images maintain their ratio
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Build the section header with title
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "See All",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
