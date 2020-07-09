class Course {
  String code;
  String imgUrl;
  String name;
  String duration;
  String description;

  Course({
    this.code,
    this.imgUrl,
    this.name,
    this.duration,
    this.description,
  });
}

List<Course> courses = [
  Course(
    code: '1',
    imgUrl: 'assets/images/python.png',
    name: 'Python',
    duration: '3 weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    code: '2',
    imgUrl: 'assets/images/arduino.png',
    name: 'Arduino',
    duration: '4 weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    code: '3',
    imgUrl: 'assets/images/js.png',
    name: 'JavaScript',
    duration: '4 weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    code: '4',
    imgUrl: 'assets/images/html.png',
    name: 'Web Dev',
    duration: '5 Weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
];
