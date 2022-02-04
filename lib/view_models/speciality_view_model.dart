class SpecialityViewModel {
  SpecialityViewModel({required this.id, required this.title, this.imageUrl = "", this.placeholder});

  final int id;
  final String title;
  final String imageUrl;
  final String? placeholder;
}
