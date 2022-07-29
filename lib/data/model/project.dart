import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:natie_portfolio/data/firebase/db.dart';

part 'project.g.dart';

/// --------------------------------------------------------------------------
/// **A model to represent projects that I've made**
///
/// **Parameters:**
/// * [id]                  : Identifier for this project
/// * [title]               : Name of this project
/// * [author]              : Who made this / What this is made for
/// * [tech]            : Programming language / Framework used
/// * [description]         : More info on this project
/// * [functionalities]     : Functional requirements of this project
/// * [iconUrl]             : Application icon of this project
/// * [imageUrls]           : Screenshots of this project
/// * [colorHex]            : The main color representing this application
/// * [completionTimestamp] : The date that this project was completed
/// * [featured]            : Will this be shown on the home page or not
///
/// **Getters:**
/// * [color]               : Convert [colorHex]'s value to [Color]
/// * [completionDate]      : Convert [completionTimestamp] to [DateTime]
/// --------------------------------------------------------------------------
@JsonSerializable()
class Project {
  String id;
  String title;
  String author;
  String authorVi;
  String tech;
  String description;
  String descriptionVi;
  List<String> functionalities;
  List<String> functionalitiesVi;
  String hostUrl;
  String iconUrl;
  List<String> imageUrls;
  int colorHex;
  int? completionTimestamp;
  bool featured;

  Project({
    this.id = '',
    this.title = '',
    this.author = '',
    this.authorVi = '',
    this.tech = '',
    this.description = '',
    this.descriptionVi = '',
    this.functionalities = const <String>[],
    this.functionalitiesVi = const <String>[],
    this.hostUrl = '',
    this.iconUrl = '',
    this.imageUrls = const <String>[
      'https://static.vecteezy.com/system/resources/previews/008/520/175/original/hand-holding-smartphone-with-screen-mockup-png.png'
    ],
    this.colorHex = 0x000000,
    this.completionTimestamp,
    this.featured = false,
  }) : assert(functionalities.length == functionalitiesVi.length ||
            functionalities.isEmpty && functionalitiesVi.isNotEmpty ||
            functionalities.isNotEmpty && functionalitiesVi.isEmpty);

  Color get color => Color(colorHex);

  DateTime? get completionDate {
    if (completionTimestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(completionTimestamp!);
  }

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
    for (Project p in values) {
      await Db.setProject(p);
    }
    if (kDebugMode) print('Update complete');
  }

  static List<Project> values = [
    aPum,
    lms,
    nieNote,
    nieFlat,
    letTutor,
    moodleMobile,
  ];

  static Project aPum = Project(
    id: 'a_pum',
    title: 'aPum',
    author: 'Nguyễn Gia Hưng',
    tech: 'android,java,sqlite,ml_kit',
    description: 'An image gallery management application compact with '
        'features like: view photos, see photo information, favorite photos, '
        'facial detection, and more…',
    descriptionVi: 'Một ứng dụng quản lý ảnh nhỏ gọn với các tính năng như: '
        'xem ảnh, thông tin ảnh, yêu thích ảnh, nhận dạng khuôn mặt, '
        'và nhiều hơn nữa…',
    functionalities: [
      'Splash screen & about screen',
      'Flexible appbar',
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
    functionalitiesVi: [
      'Màn hình splash & màn hình giới thiệu',
      'Thanh công cụ kích cỡ thông minh',
      'Chế độ tối theo cài đặt thiết bị',
      'Xem ảnh & album trên thiết bị',
      'Xem thông tin ảnh (hỗ trợ xem vị trí trên bản đồ)',
      'Chia sẻ ảnh & làm ảnh nền',
      'Sao chép/di chuyển/xóa ảnh',
      'Yêu thích ảnh',
      'Sắp xếp & tìm kiếm ảnh, album, mặt, ảnh yêu thích theo tên & thời gian',
      'Tự động cập nhật danh sách ảnh & album trên thiết bị',
      'Mở ảnh bằng aPum từ các ứng dụng khác',
      'Thêm ảnh từ chụp Camera',
      'Nhận dạng khuôn mặt thời gian thực',
      'Xem ảnh từ khuôn mặt đã nhận dạng',
    ],
    hostUrl: 'https://github.com/nateclint/aPum',
    colorHex: Colors.teal.value,
    completionTimestamp: DateTime(2021, 5).millisecondsSinceEpoch,
    featured: false,
  );

  static Project lms = Project(
    id: 'lms',
    title: 'LMS',
    author: 'Intern project at FPT Software',
    authorVi: 'Dự án thực tập tại FPT Software',
    tech: 'android,java,mongodb',
    description: 'A mobile application for a learning management system. '
        'Inspired by Quizziz, this app lets its users to see and play '
        'quizzes, and let lecturers create their own quiz with multiple types '
        'of questions. Data are taken from MongoDB through team-made RESTful '
        'APIs.',
    descriptionVi: 'Ứng dụng cho một hệ thống quản lý học tập. Lấy cảm hứng '
        'từ Quizziz, ứng dụng này cho phép người dùng xem và chơi '
        'các bài quiz, và cho giảng viên tạo bài của riêng họ với nhiều loại '
        'câu hỏi. Dữ liệu được lấy từ MongoDB qua các REST API được tạo bởi '
        'đội ngũ back-end của nhóm dự án.',
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
    functionalitiesVi: [
      'Đăng nhập/đăng ký bằng email, Google, hoặc Facebook',
      'Xem các bài quiz được đề xuất',
      'Tìm kiếm các bài quiz',
      'Xem chi tiết bài quiz',
      'Thay đổi thông tin cá nhân & mật khẩu',
      'Màn hình dashboard cho giảng viên',
      'Tạo bài quiz với 5 loại câu hỏi khác nhau',
      'Chơi bài quiz và xem điểm sau khi chơi',
    ],
    colorHex: Colors.pink.value,
    completionTimestamp: DateTime(2021, 9).millisecondsSinceEpoch,
    featured: false,
  );

  static Project nieNote = Project(
    id: 'nie_note',
    title: 'Nie Note',
    author: 'Nguyễn Gia Hưng',
    tech: 'android,java,sqlite,markdown',
    description: 'A simple note taking application. Using markdown syntax, '
        'you can create the most eye-catching notes to record everything, '
        'from your tasks, shopping list, to your snippets of code.',
    descriptionVi: 'Một ứng dụng ghi chú đơn giản. Vận dụng cú pháp markdown, '
        'bạn có thể tạo những bài ghi chú bắt mắt nhất để ghi nhận mọi thứ, từ '
        'công việc, danh sách mua hàng, đến các đoạn code của bạn.',
    functionalities: [
      'Open text files with Nie Note',
      'Add, delete, edit, restore notes',
      'Sort and search notes by id, name, color, and date',
      'Add special data into notes: images, code, quote, link, table & more…',
      'Format text: Change font, size, alignment, text style, text decoration',
      'Change note background color',
      'Undo/redo changes made to note content',
      'Preview note as markdown code or its formatted output',
      'Settings menu: theming, default format values, and more…',
    ],
    functionalitiesVi: [
      'Mở tệp văn bản bằng Nie Note',
      'Thêm, xóa, sửa, khôi phục ghi chú',
      'Sắp xếp và tìm kiếm ghi chú theo id, tên, màu, và ngày',
      'Thêm nội dung đặc biệt vào ghi chú: ảnh, code, trích dẫn, liên kết, '
          'bảng và nhiều hơn nữa…',
      'Định dạng văn bản: Thay đổi phông chữ, kích thước, căn lề, kiểu chữ, '
          'gạch chân…',
      'Thay đổi màu nền của ghi chú',
      'Undo/redo thay đổi đã thực hiện với ghi chú',
      'Xem ghi chú dưới dạng code markdown hoặc nội dung đã định dạng',
      'Menu cài đặt: màu săc app/ghi chú, các giá trị định dạng mặc định, và '
          'nhiều hơn nữa…',
    ],
    hostUrl: 'https://github.com/nateclint/nienote',
    colorHex: Colors.grey.value,
    completionTimestamp: DateTime(2021, 10).millisecondsSinceEpoch,
    featured: true,
  );

  static Project nieFlat = Project(
    id: 'nie_flat',
    title: 'Nie Flat',
    author: 'Nguyễn Gia Hưng',
    tech: 'android,java,firebase',
    description: 'A social media app for those living in an apartment complex. '
        'Communicate easily with your roommates, and keep an eye on official '
        'news. Admins also have a separate app to manage the rooms, residents, '
        'and posts made in the apartment complex. Data are synchronised with '
        'Firebase.',
    descriptionVi: 'Ứng dụng mạng xã hội cho các cư dân của một khu chung cư. '
        'Giao tiếp dễ dàng với bạn cùng phòng của bạn, và theo dõi tin tức từ '
        'chung cư. Các quản trị viên cũng có một ứng dụng riêng để quản lý các '
        'phòng, cư dân và bài đăng trong khu chung cư. Dữ liệu được đồng bộ '
        'với Firebase.',
    functionalities: [
      'Login & register',
      'View current user\'s Room information: name & residents',
      'View recent likes and replies',
      'View resident profile: posts & contact information',
      'Pin a post to room board with text & media content',
      'Interact with posts: like, reply, set reminder & copy content',
      'Search for local help & technical help',
      'Manage user profile: posts & information',
      '[Admin] Manage Rooms: View Room information, '
          'Add/remove residents in a Room',
      '[Admin] Manage Posts: Delete Posts',
      '[Admin] Manage residents: Search & add new residents, deactivate '
          'resident accounts',
      '[Admin] Edit Help information',
    ],
    functionalitiesVi: [
      'Đăng nhập & đăng ký',
      'Xem thông tin Phòng của người dùng: tên và danh sách cư dân',
      'Xem các bài bản thân được yêu thích và bình luận gần đây',
      'Xem tường nhà cư dân: bài đăng và thông tin liên hệ',
      'Đăng bài đăng vào bảng tin phòng của người dùng chứa nội dung chữ '
          'và/hoặc hình ảnh',
      'Tương tác với bài đăng: thích, bình luận, đặt hẹn nhắc, copy nội dung',
      'Tìm kiếm cứu trợ lân cận & hỗ trợ kỹ thuật',
      'Quản lý hồ sơ người dùng: bài đăng & thông tin cá nhân',
      '[Admin] Quản lý Phòng: Xem thông tin phòng, '
          'Thêm/xóa cư dân trong một phòng',
      '[Admin] Quản lý Bài Đăng: Xóa Bài Đăng',
      '[Admin] Quản lý cư dân: Tìm kiếm & thêm cư dân, vô hiệu hoá tài khoản',
      '[Admin] Sửa thông tin trợ giúp/cứu trợ',
    ],
    colorHex: Colors.amber.value,
    completionTimestamp: DateTime(2021, 12).millisecondsSinceEpoch,
    featured: true,
  );

  static Project letTutor = Project(
    id: 'let_tutor',
    title: 'LetTutor Clone',
    author: 'Nguyễn Gia Hưng',
    tech: 'flutter,jitsi',
    description: 'A one-on-one learning app to improve your English skills. '
        'Search and see your favorite tutors, join interesting courses, and '
        'register as a tutor yourself. This Flutter app uses effective state '
        'management with BlOC.',
    descriptionVi: 'Ứng dụng gia sư giúp cải thiện kỹ năng tiếng Anh của bạn. '
        'Hỗ trợ tìm gia sư, tham gia khóa học hữu ích, và đăng ký bản thân làm '
        'gia sư. Ứng dụng Flutter này sử dụng mô hình quản lý trạng thái BlOC.',
    functionalities: [
      'Login & Register',
      'Tutors: View recommended tutors, search by name & filter by '
          'specialties and other attributes',
      'Register as a tutor',
      'See tutor profile, favorite tutor, see reviews & book a class',
      'Schedule: See past & upcoming schedule, view recorded class video, '
          'see a summary of your learning progress',
      'Video call with tutor in class (using Jitsi)',
      'Update user profile',
      'Settings: app theme & app language',
    ],
    functionalitiesVi: [
      'Đăng nhập & đăng ký',
      'Gia sư: Xem gia sư được đề xuất, tìm theo tên & lọc theo chuyên môn '
          'và một số thông tin khác',
      'Đăng ký làm gia sư',
      'Xem thông tin gia sư, yêu thích gia sư, xem đánh giá và đặt lớp học',
      'Lịch: Xem lịch hẹn trong quá khứ & sắp tới, xem video của buổi học cũ, '
          'xem tổng hợp quá trình học tập của bản thân',
      'Gọi video với gia sư trong lớp (sử dụng Jitsi)',
      'Cập nhật thông tin cá nhân',
      'Cài đặt: chủ đề app và ngôn ngữ',
    ],
    colorHex: Colors.indigo.value,
    completionTimestamp: DateTime(2022, 5).millisecondsSinceEpoch,
    featured: true,
  );

  static Project moodleMobile = Project(
    id: 'moodle_mobile',
    title: 'Moodle Mobile',
    author: 'University graduation project',
    authorVi: 'Đồ án tốt nghiệp đại học',
    tech: 'flutter,moodle,firebase',
    description: 'An improved version of the mobile app created by Moodle '
        'developers, tailored for the needs of students and teachers in Ho Chi '
        'Minh City University of Science. This app aims for ease of usage, '
        'fast response, a modern UI, and new advance features.',
    descriptionVi: 'Phiên bản cải tiến của ứng dụng di động được tạo bởi những '
        'người phát triển Moodle, đã điều chỉnh theo nhu cầu của các sinh viên '
        'và giảng viên trong trường Đại học Khoa học tự nhiên. Ứng dụng nhắm '
        'đến sự tiện lợi, phản hồi nhanh, giao diện hiện đại, và hỗ trợ các '
        'tính năng nâng cao mới.',
    colorHex: Colors.green.value,
    completionTimestamp: DateTime(2022, 8).millisecondsSinceEpoch,
    featured: true,
  );
}