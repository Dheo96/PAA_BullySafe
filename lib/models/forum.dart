class Forum {
  String username;
  final String id;
  final String content;

  Forum({
    required this.username,
    required this.id,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }

  factory Forum.fromMap(Map<String, dynamic> map) {
    return Forum(
      username: map['username'],
      id: map['id'],
      content: map['content'],
    );
  }
}
