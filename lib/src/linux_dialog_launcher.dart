import 'package:dialog_launcher/src/extensions/cmd_extensions.dart';
import 'package:process_run/cmd_run.dart';

import 'dialog_launcher.dart';

class LinuxDialogLauncher extends DialogLauncher {
  @override
  Future<String> alertDialog(String title, String message, {String okButtonText = "OK"}) async {
    var cmd = 'zenity --info --title "$title" --text "$message" --ok-label "$okButtonText"';
    var result = await runCmd(cmd.toCmdLine());
    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
    return result.stdout;
  }

  @override
  Future<String> confirmDialog(String title, String message, {String yesText = "Yes", String noText = "No"}) async {
    var cmd = 'zenity --question --title "$title" --text "$message" --ok-label "$yesText" --cancel-label "$noText"';
    var result = await runCmd(cmd.toCmdLine());
    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
    return result.exitCode == 0 ? "Yes" : "No";
  }

  @override
  Future<String> multiSelectDialog(String title, String message, List<String> options) async {
    var optionsStr = options.map((option) => '"$option"').join(" ");
    var cmd = 'zenity --list --title "$title" --text "$message" --column "Options" $optionsStr --multiple';
    var result = await runCmd(cmd.toCmdLine());
    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
    return result.stdout;
  }

  @override
  Future<String> selectFileDialog(String title) async {
    var cmd = 'zenity --file-selection --title "$title"';
    var result = await runCmd(cmd.toCmdLine());
    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
    return result.stdout;
  }

  @override
  Future<String> selectFolderDialog(String title) async {
    var cmd = 'zenity --file-selection --directory --title "$title"';
    var result = await runCmd(cmd.toCmdLine());
    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }
    return result.stdout;
  }
}
