import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// --------------------------------------------------------------------------
/// A model to represent projects that I've made
/// ## Parameters:
/// * [id]              : Identifier for this project
/// * [title]           : Name of this project
/// * [author]          : Who made this project / What this project made for
/// * [language]        : Programming language / Framework used
/// * [description]     : More info on this project
/// * [functionalities] : Functional requirements of this project
/// * [iconUrl]         : Application icon of this project
/// * [imageUrls]       : Screenshots of this project
/// * [colorHex]        : The main theme color representing this application
/// * [completionDate]  : The date that this project was completed
/// * [featured]        : Whether would this project be shown on the home page
/// --------------------------------------------------------------------------
@JsonSerializable()
class Project {
  String id;
  String title;
  String author;
  String language;
  String description;
  List<String>? functionalities;
  String hostUrl;
  String iconUrl;
  List<String>? imageUrls;
  int colorHex;
  DateTime? completionDate;
  bool featured;

  Project({
    this.id = '',
    this.title = '',
    this.author = '',
    this.language = '',
    this.description = '',
    this.functionalities,
    this.hostUrl = '',
    this.iconUrl = '',
    this.imageUrls,
    this.colorHex = 0x000000,
    this.completionDate,
    this.featured = false,
  });

  /// Convert color hex value to Color
  Color get color => Color(colorHex);

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

class Projects {
  static Future update() async {

  }

  static Project aPum = Project(
    id: 'a_pum',
    title: 'aPum',
    author: 'Nate',
    language: 'Android (Java)',
    description: 'An image gallery management application compact with '
        'features like: view photos, see photo information, favorite photos, '
        'facial detection, and more…',
    functionalities: [
      'Splash screen & about screen',
      'Expandable appbar',
      'System-based dark mode',
      'View images & albums on the device',
      'See photo information (with map viewing support)',
      'Share image & make image a wallpaper',
      'Copy/move/delete images',
      'Favorite photos',
      'Sort & search images, albums, faces, favorite images by name & time',
      'Auto-update image & album list on the device',
      'Open images with aPum from other apps',
      'Add images with Camera',
      'Realtime facial detection',
      'View images from detected faces',
    ],
    hostUrl: 'https://github.com/nateclint/aPum',
    iconUrl: '',
    imageUrls: [],
    colorHex: Colors.teal.value,
    completionDate: DateTime(2021, 5),
    featured: false,
  );

  static Project lms = Project(
    id: 'lms',
    title: 'LMS',
    author: 'Intern project at FPT Software',
    language: 'Android (Java)',
    description: 'A mobile application for a learning management system. '
        'Inspired by Quizziz, this app lets its users to see and play '
        'quizzes, and let lecturers create their own quiz with multiple types '
        'of questions. Data are taken from MongoDB through team-made RESTful '
        'APIs.',
    functionalities: [
      'Login/signup with email, Google, or Facebook',
      'See recommended quizzes',
      'Search quizzes',
      'View quiz details',
      'Change user profile & password',
      'A dashboard UI for lecturers',
      'Create quizzes with 5 different types of questions',
      'Play quizzes and view scores afterwards',
    ],
    hostUrl: '',
    iconUrl: '',
    imageUrls: [],
    colorHex: Colors.pink.value,
    completionDate: DateTime(2021, 9),
    featured: false,
  );

  static Project nieNote = Project(
    id: 'nie_note',
    title: 'Nie Note',
    author: 'Nate',
    language: 'Android (Java)',
    description: 'A simple note taking application. Using markdown syntax, '
        'you can create the most eye-catching notes to record everything, '
        'from your tasks, shopping list, to your snippets of code.',
    functionalities: [
      'Open text files with Nie Note',
      'Add, delete, edit, restore notes',
      'Sort and search notes by id, name, color, and date',
      'Add special data into notes: images, code, quote, link, table & more…',
      'Format text: Change font, size, alignment, text style, text decoration',
      'Change note background color',
      'Undo/redo changes made to note content',
      'Preview note as markdown or its markdown output',
      'Settings menu: theming, default format values, and more…',
    ],
    hostUrl: 'https://github.com/nateclint/nienote',
    iconUrl: '',
    imageUrls: [],
    colorHex: Colors.grey.value,
    completionDate: DateTime(2021, 10),
    featured: true,
  );

  static Project nieFlat = Project(
    id: 'nie_flat',
    title: 'Nie Flat',
    author: 'Nate',
    language: 'Android (Java)',
    description: 'A social media app for those living in an apartment complex. '
        'Communicate easily with your roommates, and keep an eye on official '
        'news. Admins also have a separate app to manage the rooms, residents, '
        'and posts made in the apartment complex. Data are synchronised with '
        'Firebase.',
    functionalities: [
      'Login & register',
      'View current user\'s Room information: name & residents',
      'View recent likes and replies',
      'View resident profile: posts & contact information',
      'Pin a post to room board with text & media content',
      'Interact with posts: like, reply, set reminder & copy content',
      'Search for local help & technical help',
      'Manage user profile: posts & information',
      '(Admin) Manage Rooms: View Room information, '
          'Add/remove residents from a Room',
      '(Admin) Manage Posts: Delete Posts',
      '(Admin) Manage residents: Search & add new residents, deactivate '
          'resident accounts',
      '(Admin) Edit Help information',
    ],
    hostUrl: '',
    iconUrl: '',
    imageUrls: [],
    colorHex: Colors.amber.value,
    completionDate: DateTime(2021, 12),
    featured: false,
  );

  static Project letTutor = Project(
    id: 'let_tutor',
    title: 'LetTutor Copy',
    author: 'Nate',
    language: 'Flutter',
    description: 'A one-on-one learning app to improve your English skills. '
        'Search and see your favorite tutors, join interesting courses, and '
        'register as a tutor yourself. This Flutter app uses effective state '
        'management with BlOC.',
    functionalities: [
      'Login & Register',
      'Tutors: View recommended tutors, search by name & filter by '
          'specialties and other attributes',
      'Register as a tutor',
      'See tutor profile, favorite tutor, see reviews & book a class',
      'Schedule: See past schedule, upcoming & a summary of your learning '
          'progress',
      'Video call with tutor in class (using Jitsi)',
      'Update user profile',
      'Settings: app theme & app language',
    ],
    hostUrl: '',
    iconUrl: '',
    imageUrls: [],
    colorHex: Colors.indigo.value,
    completionDate: DateTime(2022, 5),
    featured: true,
  );

  static Project moodleMobile = Project(
    id: 'moodle_mobile',
    title: 'Moodle Mobile',
    author: 'University project',
    language: 'Flutter',
    description: 'An improved version of the mobile app created by Moodle '
        'developers, tailored for the needs of students and teachers in Ho Chi '
        'Minh City University of Science. This app aims for ease of usage, '
        'fast response, a modern UI, and new advance features.',
    functionalities: [],
    hostUrl: '',
    iconUrl: '',
    imageUrls: [],
    colorHex: Colors.green.value,
    completionDate: DateTime(2022, 8),
    featured: true,
  );
}