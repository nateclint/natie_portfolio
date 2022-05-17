// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      author: json['author'] as String? ?? '',
      language: json['language'] as String? ?? '',
      description: json['description'] as String? ?? '',
      functionalities: (json['functionalities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hostUrl: json['hostUrl'] as String? ?? '',
      iconUrl: json['iconUrl'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      colorHex: json['colorHex'] as int? ?? 0x000000,
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      featured: json['featured'] as bool? ?? false,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'language': instance.language,
      'description': instance.description,
      'functionalities': instance.functionalities,
      'hostUrl': instance.hostUrl,
      'iconUrl': instance.iconUrl,
      'imageUrls': instance.imageUrls,
      'colorHex': instance.colorHex,
      'completionDate': instance.completionDate?.toIso8601String(),
      'featured': instance.featured,
    };
