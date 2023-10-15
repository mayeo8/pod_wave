class Podcast {
  String image;
  String title;
  String? chanel;
  String? date;
  String? length;
  int? likes;
  int? users;
  bool liked;
  String? author;

  Podcast(
      {required this.image,
      required this.title,
      this.chanel,
      this.date,
      this.length,
      this.likes,
      this.users,
      this.liked = false,
      this.author // Initialize liked to false by default.
      });

  void toggleLike() {
    liked = !liked;
    if (liked) {
      likes = (likes ?? 0) + 1;
    } else {
      likes = (likes ?? 0) - 1;
    }
  }
}
