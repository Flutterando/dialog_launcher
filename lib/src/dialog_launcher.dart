import 'dart:io';

import 'linux_dialog_launcher.dart';
import 'macos_dialog_launcher.dart';
import 'windows_dialog_launcher.dart';

/// Abstract class representing a dialog launcher.
///
/// This class provides an interface for launching various types of dialogs
/// including alerts, confirm dialogs, multi-select dialogs, and file/folder selection dialogs.
/// Implementations should be provided for specific operating systems.
abstract class DialogLauncher {
  /// Returns a [DialogLauncher] implementation for the current platform.
  static DialogLauncher byPlatform() {
    if (Platform.isWindows) {
      return WindowsDialogLauncher();
    } else if (Platform.isLinux) {
      return LinuxDialogLauncher();
    } else if (Platform.isMacOS) {
      return MacOSDialogLauncher();
    } else {
      throw UnsupportedError('Plataforma não suportada');
    }
  }

  /// Displays an alert dialog with a given title and message.
  ///
  /// [title] specifies the title of the alert dialog.
  /// [message] specifies the content message of the dialog.
  /// [okButtonText] is an optional parameter to customize the text of the 'OK' button.
  ///
  /// Returns a [Future<String>] containing the result of the dialog interaction.
  Future<String> alertDialog(String title, String message, {String okButtonText = "OK"});

  /// Displays a confirmation dialog with a given title and message.
  ///
  /// [title] specifies the title of the confirmation dialog.
  /// [message] specifies the content message of the dialog.
  /// [yesText] and [noText] are optional parameters to customize the text of the 'Yes' and 'No' buttons respectively.
  ///
  /// Returns a [Future<String>] containing the user's choice ('Yes' or 'No').
  Future<String> confirmDialog(String title, String message, {String yesText = "Yes", String noText = "No"});

  /// Displays a multi-select dialog with a given title, message, and a list of options.
  ///
  /// [title] specifies the title of the multi-select dialog.
  /// [message] specifies the content message of the dialog.
  /// [options] is a list of strings representing the options available for selection.
  ///
  /// Returns a [Future<String>] containing the selected options.
  Future<String> multiSelectDialog(String title, String message, List<String> options);

  /// Displays a file selection dialog.
  ///
  /// [title] specifies the title of the file selection dialog.
  ///
  /// Returns a [Future<String>] containing the path of the selected file.
  Future<String> selectFileDialog(String title);

  /// Displays a folder selection dialog.
  ///
  /// [title] specifies the title of the folder selection dialog.
  ///
  /// Returns a [Future<String>] containing the path of the selected folder.
  Future<String> selectFolderDialog(String title);
}
