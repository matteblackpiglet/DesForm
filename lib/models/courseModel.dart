class Course {
  String imgUrl;
  String name;
  String duration;
  String difficulty;

  Course({
    this.imgUrl,
    this.name,
    this.duration,
    this.difficulty,
  });
}

List<Course> courses = [
  Course(
    imgUrl: 'assets/images/python.png',
    name: 'Python',
    duration: '3 weeks',
    difficulty: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    imgUrl: 'assets/images/arduino.png',
    name: 'Arduino',
    duration: '4 weeks',
    difficulty: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    imgUrl: 'assets/images/js.png',
    name: 'JavaScript',
    duration: '4 weeks',
    difficulty: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    imgUrl: 'assets/images/html.png',
    name: 'Web Dev',
    duration: '5 Weeks',
    difficulty: 'Introduction to python programming. Learn to code in the powerful language',
  ),
];
