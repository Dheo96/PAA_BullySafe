import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_bullysafe/models/article.dart';

class ArticleViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Article>> getArticles() {
    return _db.collection('articles').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList());
  }
}
