class IdTitleViewModel {
  final String id;
  final String title;
  final String? link;
  final String? imageUrl;

  IdTitleViewModel({
    required this.id,
    required this.title,
    this.link,
    this.imageUrl,
  });
}
