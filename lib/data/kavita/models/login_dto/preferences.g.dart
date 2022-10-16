// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      readingDirection: json['readingDirection'] as int?,
      scalingOption: json['scalingOption'] as int?,
      pageSplitOption: json['pageSplitOption'] as int?,
      readerMode: json['readerMode'] as int?,
      layoutMode: json['layoutMode'] as int?,
      backgroundColor: json['backgroundColor'] as String?,
      autoCloseMenu: json['autoCloseMenu'] as bool?,
      showScreenHints: json['showScreenHints'] as bool?,
      bookReaderMargin: json['bookReaderMargin'] as int?,
      bookReaderLineSpacing: json['bookReaderLineSpacing'] as int?,
      bookReaderFontSize: json['bookReaderFontSize'] as int?,
      bookReaderFontFamily: json['bookReaderFontFamily'] as String?,
      bookReaderTapToPaginate: json['bookReaderTapToPaginate'] as bool?,
      bookReaderReadingDirection: json['bookReaderReadingDirection'] as int?,
      theme: json['theme'] == null
          ? null
          : Theme.fromJson(json['theme'] as Map<String, dynamic>),
      bookReaderThemeName: json['bookReaderThemeName'] as String?,
      bookReaderLayoutMode: json['bookReaderLayoutMode'] as int?,
      bookReaderImmersiveMode: json['bookReaderImmersiveMode'] as bool?,
      globalPageLayoutMode: json['globalPageLayoutMode'] as int?,
      blurUnreadSummaries: json['blurUnreadSummaries'] as bool?,
      promptForDownloadSize: json['promptForDownloadSize'] as bool?,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'readingDirection': instance.readingDirection,
      'scalingOption': instance.scalingOption,
      'pageSplitOption': instance.pageSplitOption,
      'readerMode': instance.readerMode,
      'layoutMode': instance.layoutMode,
      'backgroundColor': instance.backgroundColor,
      'autoCloseMenu': instance.autoCloseMenu,
      'showScreenHints': instance.showScreenHints,
      'bookReaderMargin': instance.bookReaderMargin,
      'bookReaderLineSpacing': instance.bookReaderLineSpacing,
      'bookReaderFontSize': instance.bookReaderFontSize,
      'bookReaderFontFamily': instance.bookReaderFontFamily,
      'bookReaderTapToPaginate': instance.bookReaderTapToPaginate,
      'bookReaderReadingDirection': instance.bookReaderReadingDirection,
      'theme': instance.theme,
      'bookReaderThemeName': instance.bookReaderThemeName,
      'bookReaderLayoutMode': instance.bookReaderLayoutMode,
      'bookReaderImmersiveMode': instance.bookReaderImmersiveMode,
      'globalPageLayoutMode': instance.globalPageLayoutMode,
      'blurUnreadSummaries': instance.blurUnreadSummaries,
      'promptForDownloadSize': instance.promptForDownloadSize,
    };
