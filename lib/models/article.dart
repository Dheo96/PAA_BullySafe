import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String id;
  final String title;
  final String imageUrl;
  final String content;
  final String detail_article;
  final String foto_detail_articles;

  Article({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.detail_article,
    required this.foto_detail_articles,
  });

  factory Article.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Article(
      id: doc.id,
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      content: data['content'] ?? '',
      detail_article: data['detail_article'] ?? '',
      foto_detail_articles: data['foto_detail_articles'] ?? '',
    );
  }
}
