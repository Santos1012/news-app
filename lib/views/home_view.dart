import 'package:flutter/material.dart';
import 'package:my_news_test/views/news_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Text(
              "cloud",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 22,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Choose Country You want to view their News",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            CountryButton(
              country: "us",
            ),
            CountryButton(
              country: "eg",
            ),
            CountryButton(
              country: "fr",
            ),
            CountryButton(
              country: "sa",
            ),
          ],
        ),
      ),
    );
  }
}

class CountryButton extends StatelessWidget {
  final String country;

  const CountryButton({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsView(
              country: country,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
      child: Text(
        country,
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
