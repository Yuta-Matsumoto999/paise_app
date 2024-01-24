class Account {
  final String id;
  final String name;
  final String email;
  final String? avatorUrl;
  final String accountUniqueId;
  final String? backgroundImageUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Account({
    required this.id,
    required this.name,
    required this.email,
    this.avatorUrl,
    required this.accountUniqueId,
    this.backgroundImageUrl,
    required this.createdAt,
    this.updatedAt
  });
}