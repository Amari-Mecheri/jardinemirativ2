import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../classes/global_static.dart';
import '../consts/colors.dart';
import '../consts/global_variables.dart';
import '../ressources/firestore_methods.dart';
import 'marques_container.dart';
import 'text_field_input.dart';

class MarqueEditor extends StatefulWidget {
  const MarqueEditor({Key? key}) : super(key: key);

  @override
  State<MarqueEditor> createState() => _MarqueEditorState();
}

class _MarqueEditorState extends State<MarqueEditor> {
  String marqueId = "";
  Uint8List? _image;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  late Uint8List _defaultImage;
  //late bool _isNameEmpty;
  late bool _isDirty;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    GlobalStatic.onMarque = onMarque;
    //_isNameEmpty = true;
    _isDirty = false;
    rootBundle.load('image/logo.png').then((data) => setState(() {
          _defaultImage = data.buffer.asUint8List();
          _image = _defaultImage;
        }));
  }

  void selectImage(double? maxSize) async {
    Uint8List im = await GlobalStatic.pickImage(ImageSource.gallery, maxSize);
    setState(() {
      _image = im;
      checkIsDirty();
    });
  }

  void checkIsDirty() {
    _isDirty = _nameController.text.isNotEmpty ||
        _descriptionController.text.isNotEmpty ||
        marqueId.isNotEmpty;
    if (_image != _defaultImage) _isDirty = true;
  }

  void onMarque(Map<String, dynamic> data) async {
    var uri = Uri.parse(data['photoUrl']);
    Uint8List im = await readBytes(uri);

    setState(() {
      marqueId = data['marqueId'];
      _nameController.text = data['name'];
      _descriptionController.text = data['description'];
      _image = im;
      checkIsDirty();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const MarquesContainer(),
          Container(
            padding: MediaQuery.of(context).size.width > minScreenSize
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3)
                : const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                marqueId.isEmpty
                    ? const Text(
                        'Enregistrer une marque',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      )
                    : const Text(
                        'Modifier la marque',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        selectImage(-1);
                        // setState(() {
                        //   checkIsDirty();
                        // });
                      },
                      child: _image == null
                          ? const SizedBox(
                              width: 202.5,
                              height: 130,
                            )
                          : Container(
                              width: 202.5,
                              height: 130,
                              margin: const EdgeInsets.only(bottom: 28),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(_image!),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(23),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    offset: Offset(0.0, 5.0), //(x,y)
                                    blurRadius: 3.0,
                                    spreadRadius: 0.0,
                                  )
                                ],
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          selectImage(-1);
                          // setState(() {
                          //   checkIsDirty();
                          // });
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFieldInput(
                  textEditingController: _nameController,
                  hintText: 'Saisissez le nom de la marque',
                  onChanged: (val) {
                    setState(() {
                      checkIsDirty();
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Saisissez un nom de marque';
                    }
                    return '';
                  },
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    hintText: 'Saisissez une description de la marque',
                    onChanged: (val) {
                      setState(() {
                        checkIsDirty();
                      });
                    },
                    textInputType: TextInputType.text,
                    textEditingController: _descriptionController),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: _isDirty
                            ? () {
                                setState(() {
                                  clearEditor();
                                  checkIsDirty();
                                });
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            color: greyColor,
                          ),
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                                color:
                                    _isDirty ? primaryColor : secondaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: _nameController.text.isNotEmpty
                            ? () {
                                postMarque(
                                        context,
                                        marqueId,
                                        _nameController.text,
                                        _descriptionController.text,
                                        _image!)
                                    .then((value) {
                                  if (value) {
                                    setState(() {
                                      clearEditor();
                                      checkIsDirty();
                                    });
                                  }
                                });
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            color: blueColor,
                          ),
                          child: _isLoading
                              ? const Center(
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                        color: primaryColor),
                                  ),
                                )
                              : marqueId.isEmpty
                                  ? Text(
                                      'Enregistrer',
                                      style: TextStyle(
                                          color: _nameController.text.isNotEmpty
                                              ? primaryColor
                                              : secondaryColor),
                                    )
                                  : const Text(
                                      'Modifier',
                                      style: TextStyle(color: primaryColor),
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clearEditor() {
    marqueId = "";
    _nameController.clear();
    _descriptionController.clear();
    _image = _defaultImage;
  }

  Future<bool> postMarque(
    BuildContext context,
    String marqueId,
    String name,
    String description,
    Uint8List image,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadMarque(
        marqueId,
        name,
        description,
        image,
      );
      if (!mounted) return res == 'success';

      if (res == 'success') {
        GlobalStatic.showSnackBar('Ok!', context);
        return true;
      } else {
        GlobalStatic.showSnackBar(res, context);
      }
      return false;
    } catch (e) {
      GlobalStatic.showSnackBar(e.toString(), context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    return false;
  }
}
