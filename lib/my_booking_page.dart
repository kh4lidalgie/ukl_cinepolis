import 'package:flutter/material.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  // Sample data for bookings
  final List<Map<String, dynamic>> bookings = [
    {
      "banner": 'assets/images/movie1.png',
      "nama": 'Perewangan',
      "genre": 'Action',
      "rating": 4.5,
      "ageRating": 'PG-13',
    },
    {
      "banner": 'assets/images/movie2.png',
      "nama": 'Bila Esok Ibu Tiada',
      "genre": 'Drama',
      "rating": 4.2,
      "ageRating": 'R',
    },
    {
      "banner": 'assets/images/movie3.jpg',
      "nama": 'Waktu Maghrib',
      "genre": 'Comedy',
      "rating": 4.0,
      "ageRating": 'G',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          // Title Section
          Padding(
            padding: EdgeInsets.only(left: sw * 0.05, top: sw * 0.01),
            child: Text(
              "My Booking",
              style: TextStyle(
                fontSize: sw * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.watch, color: Colors.grey),
            padding: EdgeInsets.only(left: sw * 0.9),
            onPressed: () {},
          ),

          // Booking List
          Column(
            children: List.generate(
              bookings.length,
              (index) => GestureDetector(
                onTap: () {
                  // Handle booking tap
                },
                child: Padding(
                  padding: EdgeInsets.only(top: sw * 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(left: sw * 0.05),
                    width: sw * 0.98,
                    height: sw * 0.2,
                    child: Row(
                      children: [
                        // Movie Banner
                        Container(
                          width: sw * 0.5,
                          height: sw * 0.2,
                          padding: EdgeInsets.only(right: sw * 0.05),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              bookings[index]["banner"],
                              width: sw * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Movie Info
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Movie Title
                              Text(
                                bookings[index]["nama"],
                                style: TextStyle(
                                  fontSize: sw * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              // Age Rating and Genre
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: _getAgeRatingColor(
                                          bookings[index]["ageRating"]),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      bookings[index]["ageRating"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: sw * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    bookings[index]["genre"],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: sw * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              // Movie Rating
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: sw * 0.04,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${bookings[index]["rating"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: sw * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to determine age rating color
  Color _getAgeRatingColor(String ageRating) {
    switch (ageRating) {
      case 'PG-13':
        return Colors.orange;
      case 'R':
        return Colors.red;
      case 'G':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
