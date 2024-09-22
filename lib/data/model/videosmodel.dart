class VideosModel {
  String? videosId;
  String? categoriesName;
  String? courseName;
  String? videosName;
  String? videosUrl;

  VideosModel({
    this.videosId,
    this.categoriesName,
    this.courseName,
    this.videosName,
    this.videosUrl,
  });

  VideosModel.fromJson(
    Map<String, dynamic> json,
  ) {
    videosId = json['videos_id'];
    categoriesName = json['categories_name'];
    courseName = json['course_name'];
    videosName = json['videos_name'];
    videosUrl = json['videos_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videos_id'] = videosId;
    data['categories_name'] = categoriesName;
    data['course_name'] = courseName;
    data['videos_name'] = videosName;
    data['videos_url'] = videosUrl;
    return data;
  }
}

// class VideosModel {
//   final int videoId;
//   final String title;
//   final String thumbnailUrl; // Add this if it exists

//   VideosModel({
//     required this.videoId,
//     required this.title,
//     required this.thumbnailUrl, // Add this if it exists
//   });

//   factory VideosModel.fromJson(Map<String, dynamic> json) {
//     return VideosModel(
//       videoId: json['video_id'],
//       title: json['title'],
//       thumbnailUrl: json['thumbnail_url'], // Add this if it exists
//     );
//   }
// }
