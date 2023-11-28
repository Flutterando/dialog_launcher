import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

class FileCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "file";
  @override
  final description = "Select a file";

  FileCommand(this.dialogLauncher) {
    argParser.addOption('title', abbr: 't', help: 'Título do diálogo');
  }

  @override
  Future<void>? run() async {
    final response = await dialogLauncher.selectFileDialog(
      argResults?['title'] ?? 'Select a file',
    );
    print(response);
  }
}
