class AppLink {
  static const String server = "https://sarbal2.online/elearn";
  static const String imageststatic = "https://sarbal2.online/elearn/upload";

  //====================     image     =================== //

  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestCourses = "$imageststatic/courses";
  //======================================================== //
  static const String test = "$server/test.php";

  //====================     Auth      =================== //

  static const String signUp = "$server/auth/signup.php";
  static const String verfiycode = "$server/auth/verfiycode.php";
  static const String login = "$server/auth/login.php";

  //====================     home      =================== //

  static const String homepage = "$server/home.php";

  //====================     courses    =================== //
  static const String coursespage = "$server/courses/courses.php";
  static const String searchCourses = "$server/courses/search.php";
  //====================     mycourses    =================== //
  static const String mycoursesAdd = "$server/mycourses/add.php";
  static const String mycoursesRemove = "$server/mycourses/remove.php";
  static const String mycoursesView = "$server/mycourses/view.php";
  static const String mycoursesViewRemove =
      "$server/mycourses/deletefrommycourses.php";
  static const String mycoursesCount = "$server/mycourses/getcountcourses.php";

//====================     myprofile    =================== //
  static const String myprofile = "$server/myprofile.php";

  //====================     Videos    =================== //
  static const String videos = "$server/videos.php";
}
