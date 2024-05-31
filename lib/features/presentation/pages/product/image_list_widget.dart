import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/app_dialog.dart';

class ImageListWidget extends StatefulWidget {
  final List<String> availableImages;

  ImageListWidget({
    Key? key,
    required this.availableImages,
  }) : super(key: key);

  @override
  ImageListWidgetState createState() => ImageListWidgetState();
}

class ImageListWidgetState extends State<ImageListWidget> {
  List<String> availableImages = [];
  List<XFile> newImages = [];
  List<String> deletedAvailableImages = [];
  List<XFile> deletedNewImages = [];

  @override
  void initState() {
    super.initState();
    availableImages = List<String>.from(widget.availableImages);
    newImages = List<XFile>.from([]);
  }

  @override
  void didUpdateWidget(covariant ImageListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.availableImages != oldWidget.availableImages) {
      setState(() {
        availableImages = List<String>.from(widget.availableImages);
      });
    }
  }

  void onDeleteAvailableImage(int index) {
    setState(() {
      deletedAvailableImages.add(availableImages[index]);
      availableImages = List<String>.from(availableImages)..removeAt(index);
    });
  }

  void onDeleteNewImage(int index) {
    setState(() {
      deletedNewImages.add(newImages[index]);
      newImages = List<XFile>.from(newImages)..removeAt(index);
    });
  }

  Future<void> openImages() async {
    try {
      int count = (availableImages.length + newImages.length);
      print("count of images $count");
      if (count < 3) {
        var selectedFiles =
            await ImagePicker().pickMultiImage(requestFullMetadata: true);
        Set<XFile> uniqueImages = {...newImages, ...selectedFiles};
        setState(() {
          newImages = uniqueImages.toList();
        });
      } else {
        showCustomDialog(
          context,
          'Product Image Limit',
          'You can not add more than 3 image per product',
          () {},
          confirmText: 'OK',
        );
      }
    } catch (e) {
      print("Image picking error: $e");
    }
  }

  void clear() {
    newImages = List<XFile>.from([]);
    deletedNewImages = List<XFile>.from([]);
    deletedAvailableImages = List<String>.from([]);
  }

  List<String> getDeletedAvailableImages() {
    return deletedAvailableImages;
  }

  List<String> getAvailableImages() {
    return availableImages;
  }

  List<XFile> getNewImages() {
    return newImages;
  }

  List<XFile> getDeletedNewImages() {
    return deletedNewImages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (availableImages.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: availableImages.asMap().entries.map((entry) {
                final index = entry.key;
                final imageUrl = entry.value;
                return Container(
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(4)),
                        child: Image.network(
                          imageUrl,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          onDeleteAvailableImage(index);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: newImages.asMap().entries.map((entry) {
            final index = entry.key;
            final imageFile = entry.value;
            return Container(
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(4)),
                    child: kIsWeb
                        ? Image.network(
                            imageFile.path,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(imageFile.path),
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      imageFile.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      onDeleteNewImage(index);
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: InkWell(
            onTap: openImages,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.blue,
                    ),
                    Text(
                      'Upload Image',
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
