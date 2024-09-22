class CoursesModel {
  int? coursesId;
  String? coursesName;
  String? coursesDesc;
  String? coursesImage;
  String? coursesVideo;
  int? coursesCat;
  int? coursesMore;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  int? mycourses;

  CoursesModel({
    this.coursesId,
    this.coursesName,
    this.coursesImage,
    this.coursesVideo,
    this.coursesCat,
    this.coursesMore,
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.mycourses,
    this.coursesDesc,
  });

  CoursesModel.fromJson(Map<String, dynamic> json) {
    coursesId = json['courses_id'];
    coursesName = json['courses_name'];
    coursesImage = json['courses_image'];
    coursesVideo = json['courses_video'];
    coursesCat = json['courses_cat'];
    coursesDesc = json['courses_desc'];
    coursesMore = json['courses_more'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    mycourses = json['mycourses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courses_id'] = coursesId;
    data['courses_name'] = coursesName;
    data['courses_image'] = coursesImage;
    data['courses_video'] = coursesVideo;
    data['courses_cat'] = coursesCat;
    data['courses_desc'] = coursesDesc;
    data['courses_more'] = coursesMore;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_image'] = categoriesImage;

    data['mycourses'] = mycourses;
    return data;
  }
}
