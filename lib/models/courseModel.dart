class Course {
  String imgUrl;
  String wpUrl;
  String name;
  String duration;
  String description;

  Course({
    this.imgUrl,
    this.wpUrl,
    this.name,
    this.duration,
    this.description,
  });
}

List<Course> courses = [
  Course(
    imgUrl: 'assets/images/python.png',
    wpUrl: 'assets/images/python_wp.jpg',
    name: 'Python',
    duration: '3 weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    imgUrl: 'assets/images/arduino.png',
    wpUrl: 'assets/images/arduino_wp.jpg',
    name: 'Arduino',
    duration: '4 weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    imgUrl: 'assets/images/js.png',
    wpUrl: 'assets/images/js_wp.jpg',
    name: 'JavaScript',
    duration: '4 weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
  Course(
    imgUrl: 'assets/images/html.png',
    wpUrl: 'assets/images/webdev_wp.jpg',
    name: 'Web Dev',
    duration: '5 Weeks',
    description: 'Introduction to python programming. Learn to code in the powerful language',
  ),
];
