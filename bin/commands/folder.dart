import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

class FolderCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "folder";
  @override
  final description = "Select a folder";

  FolderCommand(this.dialogLauncher) {
    argParser.addOption('title', abbr: 't', help: 'Título do diálogo');
  }

  @override
  Future<void>? run() async {
    final response = await dialogLauncher.selectFileDialog(
      argResults?['title'] ?? 'Select a folder',
    );
    print(response);
  }
}
