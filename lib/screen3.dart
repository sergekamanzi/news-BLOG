import 'package:flutter/material.dart';
import 'services/news_api_service.dart'; // Replace 'your_project' with your actual project name

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final NewsApiService _newsApiService = NewsApiService();
  late Future<List<dynamic>> _newsArticles;

  @override
  void initState() {
    super.initState();
    _newsArticles = _newsApiService.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 55, 161),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo2.png', // Replace with your actual icon path
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Latest News',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No news articles available.'),
            );
          } else {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: ListTile(
                    leading: article['urlToImage'] != null
                        ? Image.network(
                            article['urlToImage'],
                            width: 60,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.article, size: 60),
                    title: Text(
                      article['title'] ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      article['description'] ?? 'No Description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(article['title'] ?? 'No Title'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                article['urlToImage'] != null
                                    ? Image.network(article['urlToImage'])
                                    : Icon(Icons.article),
                                SizedBox(height: 10),
                                Text(article['content'] ?? 'No Content'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
