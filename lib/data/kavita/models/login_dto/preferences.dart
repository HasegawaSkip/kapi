import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'theme.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences extends Equatable {
  final int? readingDirection;
  final int? scalingOption;
  final int? pageSplitOption;
  final int? readerMode;
  final int? layoutMode;
  final String? backgroundColor;
  final bool? autoCloseMenu;
  final bool? showScreenHints;
  final int? bookReaderMargin;
  final int? bookReaderLineSpacing;
  final int? bookReaderFontSize;
  final String? bookReaderFontFamily;
  final bool? bookReaderTapToPaginate;
  final int? bookReaderReadingDirection;
  final Theme? theme;
  final String? bookReaderThemeName;
  final int? bookReaderLayoutMode;
  final bool? bookReaderImmersiveMode;
  final int? globalPageLayoutMode;
  final bool? blurUnreadSummaries;
  final bool? promptForDownloadSize;

  const Preferences({
    this.readingDirection,
    this.scalingOption,
    this.pageSplitOption,
    this.readerMode,
    this.layoutMode,
    this.backgroundColor,
    this.autoCloseMenu,
    this.showScreenHints,
    this.bookReaderMargin,
    this.bookReaderLineSpacing,
    this.bookReaderFontSize,
    this.bookReaderFontFamily,
    this.bookReaderTapToPaginate,
    this.bookReaderReadingDirection,
    this.theme,
    this.bookReaderThemeName,
    this.bookReaderLayoutMode,
    this.bookReaderImmersiveMode,
    this.globalPageLayoutMode,
    this.blurUnreadSummaries,
    this.promptForDownloadSize,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) {
    return _$PreferencesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  List<Object?> get props {
    return [
      readingDirection,
      scalingOption,
      pageSplitOption,
      readerMode,
      layoutMode,
      backgroundColor,
      autoCloseMenu,
      showScreenHints,
      bookReaderMargin,
      bookReaderLineSpacing,
      bookReaderFontSize,
      bookReaderFontFamily,
      bookReaderTapToPaginate,
      bookReaderReadingDirection,
      theme,
      bookReaderThemeName,
      bookReaderLayoutMode,
      bookReaderImmersiveMode,
      globalPageLayoutMode,
      blurUnreadSummaries,
      promptForDownloadSize,
    ];
  }
}
