import 'package:flutter/material.dart';

void main() => runApp(BarbershopApp());

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbershop Booking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopBar(),
            _buildBanner(),
            _buildSearchBar(),
            _buildNearestBarbershopSection(),
            _buildMostRecommendedSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('19:27', style: TextStyle(fontSize: 24)),
              Text('Yogyakarta', style: TextStyle(fontSize: 16)),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('- assets/7.jpg'), // Placeholder for your image
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Booking Now', style: TextStyle(fontSize: 24)),
              Text('Find the best barbershop near you', style: TextStyle(fontSize: 16)),
            ],
          ),
          Image.asset('assets/2.png', width: 100, height: 100), // Placeholder for your image
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search barber\'s, haircut ser...',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildNearestBarbershopSection() {
    return Column(
      children: [
        _buildSectionTitle('Nearest Barbershop'),
        _buildBarbershopCard('Alana Barbershop', 'Haircut massage & Spa', 'Banguntapan, 5 km', 4.5, 'assets/3.jpg'),
        _buildBarbershopCard('Hercha Barbershop', 'Haircut & Styling', 'Jalan Kaliurang, 8 km', 4.5, 'assets/4.jpg'),
        _buildBarbershopCard('Barberking', 'Haircut styling & massage', 'Jogja Expo Centre, 12 km', 4.5, 'assets/5.webp'),
        TextButton(onPressed: () {}, child: Text('See All')),
      ],
    );
  }

  Widget _buildMostRecommendedSection() {
    return Column(
      children: [
        _buildSectionTitle('Most Recommended'),
        _buildBarbershopCard('Master Piece Barbershop', 'Haircut styling', 'Jogja Expo Centre, 2 km', 5.0, 'assets/6.jpg', booking: true),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBarbershopCard(String name, String service, String location, double rating, String imagePath, {bool booking = false}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: double.infinity, height: 150, fit: BoxFit.cover), // Placeholder for your image
            SizedBox(height: 8),
            Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(service),
            Text(location),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(rating.toInt(), (index) => Icon(Icons.star, color: Colors.yellow)),
                ),
                if (booking) ElevatedButton(onPressed: () {}, child: Text('Booking'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
