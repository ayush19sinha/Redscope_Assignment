class Repo {
  final String id;
  final String description;
  final int commentCount;
  final DateTime createdDate;
  final DateTime updatedDate;
  final Map<String, dynamic> owner;
  final List<dynamic> files;

  Repo({
    required this.id,
    required this.description,
    required this.commentCount,
    required this.createdDate,
    required this.updatedDate,
    required this.owner,
    required this.files,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      id: json['id'],
      description: json['description'] ?? '',
      commentCount: json['comments'] ?? 0,
      createdDate: DateTime.parse(json['created_at']),
      updatedDate: DateTime.parse(json['updated_at']),
      owner: json['owner'],
      files: json['files'].values.toList(),
    );
  }
}
