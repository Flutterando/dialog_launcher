import 'package:dialog_launcher/src/extensions/cmd_extensions.dart';
import 'package:process_run/cmd_run.dart';

import 'dialog_launcher.dart';

class WindowsDialogLauncher extends DialogLauncher {
  @override
  Future<String> alertDialog(String title, String message, {String okButtonText = "OK"}) async {
    var script = 'Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show("$message", "$title", [System.Windows.MessageBoxButton]::OK)';
    var cmd = 'powershell -Command "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.stdout.trim();
  }

  @override
  Future<String> confirmDialog(String title, String message, {String yesText = "Yes", String noText = "No"}) async {
    var script = 'Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show("$message", "$title", [System.Windows.MessageBoxButton]::YesNo)';
    var cmd = 'powershell -Command "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.exitCode == 0 ? yesText : noText;
  }

  @override
  Future<String> multiSelectDialog(String title, String message, List<String> options) async {
    // No PowerShell, não há um equivalente direto para um diálogo de seleção múltipla.
    // Esta implementação requer uma solução mais criativa ou a criação de uma ferramenta auxiliar.
    return "Not Implemented";
  }

  @override
  Future<String> selectFileDialog(String title) async {
    var script =
        '[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms");\$dialog = New-Object System.Windows.Forms.OpenFileDialog;\$dialog.Title = "$title";if (\$dialog.ShowDialog() -eq "OK") { \$dialog.FileName } else { "" }';
    var cmd = 'powershell -Command "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.stdout.trim();
  }

  @override
  Future<String> selectFolderDialog(String title) async {
    var script =
        '[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms");\$dialog = New-Object System.Windows.Forms.FolderBrowserDialog;\$dialog.Description = "$title";if (\$dialog.ShowDialog() -eq "OK") { \$dialog.SelectedPath } else { "" }';
    var cmd = 'powershell -Command "$script"';
    var result = await runCmd(cmd.toCmdLine());
    return result.stdout.trim();
  }
}
