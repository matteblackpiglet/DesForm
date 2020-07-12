class Profile {
  String name;
  String username;
  String dob;
  String gender;
  String ongoingCourses;
  String completedCourses;
  String profileUrl;
  String email;
  List<String> courses;

    Profile({
    this.name,
    this.username,
    this.dob,
    this.gender,
    this.ongoingCourses,
    this.completedCourses,
    this.profileUrl,
    this.email,
    this.courses,
  });
}

Profile profile = Profile(
  name: 'X Æ A-12',
  username: 'xaea12',
  dob: '12-2-1994',
  gender: 'Male',
  ongoingCourses: '1',
  completedCourses: '1',
  profileUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM--hVamcJhFyQcqARua0LV9c-opvPKdxCZw&usqp=CAU',
  email: 'XÆA12@gmail.com',
  courses: ['1', '3'],
);