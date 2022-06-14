

/*
@overrideWidget
build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.file_download),
            label: Text("Örnek Pdf İndir"),
            onPressed: () {
              _downloadSamplePDF();
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.file_download),
            label: Text("Örnek Video İndir"),
            onPressed: () {
              _downloadSampleVideo();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_filePath),
          ),
          TextButton.icon(
            icon: Icon(Icons.tv),
            label: Text("İndirilen Dosyayı Göster"),
            onPressed: () async {
              final _openFile = await OpenFile.open(_filePath);
              print(_openFile);
            },
          ),
        ],
      ),
    ),
  );
}
*/