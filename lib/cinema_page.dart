import 'package:flutter/material.dart';

class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // list movie
  final List<Map<String, dynamic>> categories = [
    {
      "poster": 'assets/images/mv1.jpeg',
      "nama": 'Live In Time',
      "genre": 'Romance',
      "rating": 4.5,
    },
    {
      "poster": 'assets/images/mv2.png',
      "nama": 'Moana 2',
      "genre": 'Drama',
      "rating": 4.2,
    },
    {
      "poster": 'assets/images/mv3.jpg',
      "nama": 'Redone',
      "genre": 'Comedy',
      "rating": 4.0,
    },
  ];

  // list cinema
  final List<Map<String, dynamic>> cinemas = [
    {
      "name": "Malang Town Square",
      "distance": "8.03 km",
      "facilities": "REGULAR • LUXE",
    },
    {
      "name": "Lippo Plaza Batu",
      "distance": "11.23 km",
      "facilities": "REGULAR",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: DropdownButton<String>(
          value: 'Malang',
          items: <String>['Malang', 'Jakarta', 'Surabaya'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            // untuk pindah movie-cinema
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Movie"),
            Tab(text: "Cinema"),
          ],
        ),
      ),
      body: Column(
        children: [
          // search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cinema / Movie',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // TabBarView untuk movies & cinema
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMovieGridView(), // Movies Content
                _buildCinemaListView(), // Cinemas Content
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build the GridView for movies
  Widget _buildMovieGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.asset(
                      category["poster"],
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category["nama"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      category["genre"],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '${category["rating"]}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Build the ListView for cinemas
  Widget _buildCinemaListView() {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: cinemas.length,
      itemBuilder: (context, index) {
        final cinema = cinemas[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cinema["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '${cinema["distance"]} away',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.movie, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      cinema["facilities"],
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
