class MyCoursesModel {
  int? mycoursesId;
  int? mycoursesUsersid;
  int? mycoursesCoursesid;
  int? coursesId;
  String? coursesName;
  String? coursesImage;
  String? coursesVideo;
  int? coursesCat;
  int? coursesMore;
  int? usersId;

  MyCoursesModel(
      {this.mycoursesId,
      this.mycoursesUsersid,
      this.mycoursesCoursesid,
      this.coursesId,
      this.coursesName,
      this.coursesImage,
      this.coursesVideo,
      this.coursesCat,
      this.coursesMore,
      this.usersId});

  MyCoursesModel.fromJson(Map<String, dynamic> json) {
    mycoursesId = json['mycourses_id'];
    mycoursesUsersid = json['mycourses_usersid'];
    mycoursesCoursesid = json['mycourses_coursesid'];
    coursesId = json['courses_id'];
    coursesName = json['courses_name'];
    coursesImage = json['courses_image'];
    coursesVideo = json['courses_video'];
    coursesCat = json['courses_cat'];
    coursesMore = json['courses_more'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mycourses_id'] = mycoursesId;
    data['mycourses_usersid'] = mycoursesUsersid;
    data['mycourses_coursesid'] = mycoursesCoursesid;
    data['courses_id'] = coursesId;
    data['courses_name'] = coursesName;
    data['courses_image'] = coursesImage;
    data['courses_video'] = coursesVideo;
    data['courses_cat'] = coursesCat;
    data['courses_more'] = coursesMore;
    data['users_id'] = usersId;
    return data;
  }
}
