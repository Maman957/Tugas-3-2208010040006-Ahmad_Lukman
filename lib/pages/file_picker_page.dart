import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({super.key});

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  String selectedFilePath = "Tidak ada file";
  DateTime? selectedDate;

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        selectedFilePath = file.name;
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime(2030));

    if (pickDate != null) {
      setState(() {
        selectedDate = pickDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload"), centerTitle: true),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 45, 64, 89),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://1996photolab.com/wp-content/uploads/2017/04/upload-cloud-white.png",
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Pilih file yang akan di uploud",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                selectFile();
                              },
                              child: const Text("Pilih File")),
                          Text(
                            "File yang dipilih : $selectedFilePath",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _selectDate();
                              },
                              child: const Text("Pilih Tanggal")),
                          Text(
                            "Tanggal uploud : $selectedDate",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
