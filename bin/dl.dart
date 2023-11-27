import 'package:args/args.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

Future<void> main(List<String> arguments) async {
  var parser = ArgParser()
    ..addOption('type', abbr: 't', help: 'Tipo de diálogo (alert, confirm, file, folder)')
    ..addOption('title', abbr: 'l', help: 'Título do diálogo')
    ..addOption('message', abbr: 'm', help: 'Mensagem do diálogo')
    ..addOption('okButtonText', abbr: 'o', help: 'Texto do botão OK para alertas', defaultsTo: 'OK')
    ..addOption('yesText', abbr: 'y', help: 'Texto para botão SIM em confirmações', defaultsTo: 'Yes')
    ..addOption('noText', abbr: 'n', help: 'Texto para botão NÃO em confirmações', defaultsTo: 'No');

  var results = parser.parse(arguments);

  var dialogLauncher = DialogLauncher.byPlatform();

  try {
    String response = '';
    switch (results['type']) {
      case 'alert':
        response = await dialogLauncher.alertDialog(results['title'], results['message'], okButtonText: results['okButtonText']);
        break;
      case 'confirm':
        response = await dialogLauncher.confirmDialog(results['title'], results['message'], yesText: results['yesText'], noText: results['noText']);
        break;
      case 'file':
        response = await dialogLauncher.selectFileDialog(results['title']);
        break;
      case 'folder':
        response = await dialogLauncher.selectFolderDialog(results['title']);
        break;
      default:
        print('Tipo de diálogo não especificado ou não reconhecido.');
        return;
    }
    print(response);
  } catch (e) {
    print('Ocorreu um erro: $e');
  }
}
