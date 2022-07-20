// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      author: json['author'] as String? ?? '',
      authorVi: json['authorVi'] as String? ?? '',
      language: json['language'] as String? ?? '',
      description: json['description'] as String? ?? '',
      descriptionVi: json['descriptionVi'] as String? ?? '',
      functionalities: (json['functionalities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      functionalitiesVi: (json['functionalitiesVi'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      hostUrl: json['hostUrl'] as String? ?? '',
      iconUrl: json['iconUrl'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      colorHex: json['colorHex'] as int? ?? 0x000000,
      completionTimestamp: json['completionTimestamp'] as int?,
      featured: json['featured'] as bool? ?? false,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'authorVi': instance.authorVi,
      'language': instance.language,
      'description': instance.description,
      'descriptionVi': instance.descriptionVi,
      'functionalities': instance.functionalities,
      'functionalitiesVi': instance.functionalitiesVi,
      'hostUrl': instance.hostUrl,
      'iconUrl': instance.iconUrl,
      'imageUrls': instance.imageUrls,
      'colorHex': instance.colorHex,
      'completionTimestamp': instance.completionTimestamp,
      'featured': instance.featured,
    };
