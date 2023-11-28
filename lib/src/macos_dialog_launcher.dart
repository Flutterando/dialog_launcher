import 'package:dialog_launcher/src/extensions/cmd_extensions.dart';
import 'package:process_run/cmd_run.dart';

import 'dialog_launcher.dart';

class MacOSDialogLauncher extends DialogLauncher {
  @override
  Future<String> alertDialog(String title, String message, {String okButtonText = "OK"}) async {
    var script = 'display dialog "$message" with title "$title" buttons {"$okButtonText"} default button 1';
    var cmd = 'osascript -e "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.stdout.trim();
  }

  @override
  Future<String> confirmDialog(String title, String message, {String yesText = "Yes", String noText = "No"}) async {
    var script = 'display dialog "$message" with title "$title" buttons {"$noText", "$yesText"} default button 2';
    var cmd = 'osascript -e "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.exitCode == 0 ? yesText : noText;
  }

  @override
  Future<String> multiSelectDialog(String title, String message, List<String> options) async {
    // Não há um equivalente direto para um diálogo de seleção múltipla no macOS usando apenas osascript.
    return "Not Implemented";
  }

  @override
  Future<String> selectFileDialog(String title) async {
    var script = 'choose file with prompt "$title"';
    var cmd = 'osascript -e "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.stdout.trim();
  }

  @override
  Future<String> selectFolderDialog(String title) async {
    var script = 'choose folder with prompt "$title"';
    var cmd = 'osascript -e "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.stdout.trim();
  }
}
