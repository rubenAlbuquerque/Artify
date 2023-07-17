class Story {
  final String imageUrl;
  final String username;

  Story({
    required this.imageUrl,
    required this.username,
  });
}

class Post {
  final String userImageUrl;
  final String username;
  final String description;

  final String date;
  final String largeImageUrl;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.userImageUrl,
    required this.username,
    required this.description,
    required this.date,
    required this.largeImageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

class Album {
  final String id;
  final String name;
  final String imageUrl;

  Album({required this.id, required this.name, required this.imageUrl});
}

// Model musci data model
class Result {
  final String nome; //nome, nome muscia, nome album
  final String type; // Musica, playlsi, artista
  final String artist;
  final String coverImg;
  final String duration;

  Result(this.nome, this.type, this.artist, this.coverImg, this.duration);
}
