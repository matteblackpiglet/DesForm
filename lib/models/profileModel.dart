class Profile {
  String name;
  String username;
  String dob;
  String gender;
  String ongoingCourse;
  String completedCourse;
  String profileUrl;
  String email;

    Profile({
    this.name,
    this.username,
    this.dob,
    this.gender,
    this.ongoingCourse,
    this.completedCourse,
    this.profileUrl,
    this.email,
  });
}

Profile profile = Profile(
  name: 'X Æ A-12',
  username: 'xaea12',
  dob: '12-2-1994',
  gender: 'male',
  ongoingCourse: '3',
  completedCourse: '1',
  profileUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQM--hVamcJhFyQcqARua0LV9c-opvPKdxCZw&usqp=CAU',
  email: 'XÆA12@gmail.com',
);