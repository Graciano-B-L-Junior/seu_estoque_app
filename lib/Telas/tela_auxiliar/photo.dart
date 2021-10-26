import 'package:app_estoque/Auxiliar/display_photo.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class photo extends StatefulWidget {
  final CameraDescription camera;
  const photo({Key? key, required this.camera}) : super(key: key);

  @override
  _photoState createState() => _photoState();
}

class _photoState extends State<photo> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    // TODO: implement initState
    super.initState();
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tire uma foto"),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Container(
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(_controller),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade600,
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            await _controller.setFlashMode(FlashMode.off);
            final image = await _controller.takePicture();

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Displayfoto(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
