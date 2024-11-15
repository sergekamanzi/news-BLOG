import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 55, 161),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with your actual icon path
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Top News',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen3');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 97, 97, 255),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 19),
              ),
              child: Text(
                'Go to Latest News',
                style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
             ),
            ),
            SizedBox(height: 20),
            // First news article
            newsArticleWidget(
              imagePath: 'assets/images/new1.jpg', // Replace with your actual image path
              title: 'country',
              description:
                  'In India we have discovered something that can cause the city harm in terms of its cleanliness and health. We offer great protection on its defense.',
            ),
            SizedBox(height: 20),
            // Second news article
            newsArticleWidget(
              imagePath: 'assets/images/new2.jpg', // Replace with your actual image path
              title: 'football',
              description:
                  'Live games, scores, latest football news, transfers, results, fixtures, and team news from the Premier to the Champions League.',
            ),

            SizedBox(height: 20),
            // Second news article
            newsArticleWidget(
              imagePath: 'assets/images/new3.png', // Replace with your actual image path
              title: 'Rwanda',
              description:
                  '"Marburg virus in Rwanda is over," Health Minister Sabin Nsanzimana said dur.economictimes.indiatimes.com/news/industry/marburg-virus-over-in-rwanda-says-health-minister/115324310',
           ),
          ],
        ),
      ),
    );
  }

  Widget newsArticleWidget({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$title: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
