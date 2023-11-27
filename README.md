# Dialog Launcher

A Dart package to facilitate the creation and handling of dialog boxes in command line interfaces across different operating systems (Windows, Linux, and macOS).

## Features

- **Cross-platform Support**: Works on Windows, Linux, and macOS.
- **Various Dialog Types**: Supports alert, confirmation, file selection, and folder selection dialogs.
- **Customizable**: Allows customization of titles, messages, and button texts.
- **Direct Dart Usage**: Can be used directly within Dart code for more complex applications.

## Installation

To install the package globally, run:

```bash
dart pub global activate dialog_launcher
```

This will make the `dl` command available globally in your terminal.

## Usage

## Command Line

The `dl` command can be used to launch different types of dialogs. Here are some examples:

### Alert Dialog
```bash
dl --type alert --title "Warning" --message "This is an alert."
```

### Confirmation Dialog
```bash
dl --type confirm --title "Confirm" --message "Are you sure?" --yesText "Yes" --noText "No"
```

### File Selection Dialog
```bash
dl --type file --title "Select a file"
```

### Folder Selection Dialog
```bash
dl --type folder --title "Select a folder"
```

## In Dart Code
You can also use DialogLauncher directly in your Dart code. Here's an example:

```dart
import 'dialog_launcher.dart';

void main() async {
  var dialogLauncher = DialogLauncher.byPlatform();
  var response = await dialogLauncher.alertDialog("Title", "This is a message");
  print(response);
}
```

This approach is suitable for integrating dialog functionalities into more complex Dart applications.

## Arguments
```
--type: Specifies the type of dialog (alert, confirm, file, folder).
--title: Sets the title of the dialog.
--message: Sets the message for alert or confirmation dialogs.
--okButtonText: (Optional) Custom text for the OK button in alert dialogs.
--yesText: (Optional) Custom text for the Yes button in confirmation dialogs.
--noText: (Optional) Custom text for the No button in confirmation dialogs.
```

## License
MIT License

## Contributing
Contributions are welcome! Please submit pull requests with any improvements or bug fixes.

## Acknowledgments
This package uses native system commands and scripts to create dialogs, leveraging tools like zenity on Linux, AppleScript on macOS, and PowerShell on Windows.