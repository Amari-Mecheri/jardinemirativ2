import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jardinemirativ2/models/categorie.dart';
import 'package:jardinemirativ2/widgets/admin/products_list.dart';

import '../../classes/global_static.dart';
import '../../classes/services/categorie_service.dart';
import '../../classes/services/marque_service.dart';
import '../../consts/colors.dart';
import '../../consts/global_variables.dart';
import '../../models/marque.dart';
import '../../models/product.dart';
import '../../ressources/firestore_methods.dart';
import 'text_field_input.dart';

class ProductEditor extends StatefulWidget {
  const ProductEditor({Key? key}) : super(key: key);

  @override
  State<ProductEditor> createState() => _ProductEditorState();
}

class _ProductEditorState extends State<ProductEditor> {
  String productId = "";
  List likes = [];
  Uint8List? _image;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _marqueIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();

  late String _selectedMarque = "";
  final List<DropdownMenuItem<String>> _marques = [
    const DropdownMenuItem(
      value: '',
      child: Text(''),
    )
  ];
  late String _selectedCategorie = '';
  final _categories = [
    const DropdownMenuItem(
      value: '',
      child: Text(''),
    )
  ];
  late String _selectedGenre = '';
  final _genres = GlobalStatic.genres
      .map(
        (String e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  late Uint8List _defaultImage;
  late bool _isDirty;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    GlobalStatic.onProduct = onProduct;
    //_isNameEmpty = true;
    _isDirty = false;
    rootBundle.load('image/logo.png').then((data) => setState(() {
          _defaultImage = data.buffer.asUint8List();
          _image = _defaultImage;
        }));
    _marques.addAll(Marques().listMarques.map(
      (Marque e) {
        return DropdownMenuItem(
          value: e.marqueId,
          child: Text(e.name),
        );
      },
    ).toList());
    _categories.addAll(Categories().listCategories.map(
      (Categorie e) {
        return DropdownMenuItem(
          value: e.categorieId,
          child: Text(e.name),
        );
      },
    ).toList());
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
        _titleController.text.isNotEmpty ||
        _priceController.text.isNotEmpty ||
        _selectedMarque.isNotEmpty ||
        _selectedCategorie.isNotEmpty ||
        _selectedGenre.isNotEmpty ||
        productId.isNotEmpty;
    if (_image != _defaultImage) _isDirty = true;
  }

  void onProduct(Product data) async {
    var uri = Uri.parse(data.photoUrl);
    Uint8List im = await readBytes(uri);

    setState(() {
      productId = data.productId;
      likes = data.likes;
      _nameController.text = data.name;
      _descriptionController.text = data.description;
      _titleController.text = data.title;
      _priceController.text = data.price.toString();
      _selectedMarque = data.marqueId;
      _selectedGenre = data.genre;
      _selectedCategorie = data.categorieId;
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
          Container(
            padding: MediaQuery.of(context).size.width > minScreenSize
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 10)
                : const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                productId.isEmpty
                    ? const Text(
                        'Enregistrer un article',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      )
                    : const Text(
                        "Modifier l'article",
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
                              width: 15 * 7,
                              height: 30 * 7,
                            )
                          : Container(
                              width: 15 * 7,
                              height: 30 * 7,
                              margin: const EdgeInsets.only(bottom: 6 * 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                //color: Colors.blueGrey,
                                image: DecorationImage(
                                  image: MemoryImage(_image!),
                                  //fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                width: 12 * 7,
                                height: 27.2 * 7,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    _nameController.text,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 40,
                      child: IconButton(
                        onPressed: () {
                          selectImage(-1);
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                // Nom
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceAround,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SizedBox(
                            width: 400,
                            child: TextFieldInput(
                              textEditingController: _nameController,
                              hintText: "Saisissez le nom de l'article",
                              onChanged: (val) {
                                setState(() {
                                  checkIsDirty();
                                });
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Saisissez un nom de l'article";
                                }
                                return '';
                              },
                              textInputType: TextInputType.text,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 24,
                          // ),
                          // titre
                          SizedBox(
                            width: 400,
                            child: TextFieldInput(
                              textEditingController: _titleController,
                              hintText: "Saisissez un titre",
                              onChanged: (val) {
                                setState(() {
                                  checkIsDirty();
                                });
                              },
                              textInputType: TextInputType.text,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 24,
                          // ),
                          // Description
                          SizedBox(
                            width: 400,
                            child: TextFieldInput(
                                hintText:
                                    "Saisissez une description de l'article",
                                onChanged: (val) {
                                  setState(() {
                                    checkIsDirty();
                                  });
                                },
                                textInputType: TextInputType.text,
                                textEditingController: _descriptionController),
                          ),
                          // const SizedBox(
                          //   height: 24,
                          // ),
                          // Prix
                          SizedBox(
                            width: 400,
                            child: TextFieldInput(
                              textEditingController: _priceController,
                              hintText: "Saisissez le prix",
                              onChanged: (val) {
                                setState(() {
                                  checkIsDirty();
                                });
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Saisissez un prix";
                                }
                                return '';
                              },
                              textInputType: TextInputType.text,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 24,
                          // ),
                          //Marque
                          //const Text('La marque :'),
                          _marques.isNotEmpty
                              ? SizedBox(
                                  width: 400,
                                  child: DropdownButtonFormField(
                                      value: _selectedMarque.isEmpty
                                          ? null
                                          : _selectedMarque,
                                      hint: const Text('Marques'),
                                      items: _marques,
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedMarque = val.toString();
                                          checkIsDirty();
                                        });
                                      }),
                                )
                              : Container(),
                          // // Categorie
                          //const Text('La catégorie :'),
                          SizedBox(
                            width: 400,
                            child: DropdownButtonFormField(
                                value: _selectedCategorie.isEmpty
                                    ? null
                                    : _selectedCategorie,
                                hint: const Text('Catégories'),
                                items: _categories,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedCategorie = val.toString();
                                    checkIsDirty();
                                  });
                                }),
                          ),

                          // Genre
                          //const Text('Le genre :'),
                          SizedBox(
                            width: 400,
                            child: DropdownButtonFormField(
                                value: _selectedGenre.isEmpty
                                    ? null
                                    : _selectedGenre,
                                hint: const Text('Genre'),
                                items: _genres,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedGenre = val.toString();
                                    checkIsDirty();
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          width: 400,
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
                                postProduct(
                                        context,
                                        _nameController.text,
                                        productId,
                                        _titleController.text,
                                        _descriptionController.text,
                                        double.tryParse(_priceController.text)!,
                                        _selectedMarque,
                                        _selectedGenre,
                                        _selectedCategorie,
                                        likes,
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
                          width: 400,
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
                              : productId.isEmpty
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
                // const SizedBox(
                //   height: 400,
                // ),
              ],
            ),
          ),
          const ProductsList(),
        ],
      ),
    );
  }

  void clearEditor() {
    productId = "";
    likes = [];
    _nameController.clear();
    _descriptionController.clear();
    _titleController.clear();
    _priceController.clear();
    _selectedMarque = '';
    _selectedGenre = '';
    _selectedCategorie = '';
    _image = _defaultImage;
  }

  Future<bool> postProduct(
    BuildContext context,
    final String name,
    final String productId,
    final String title,
    final String description,
    final double price,
    final String marqueId,
    final String genre,
    final String categorieId,
    final List likes,
    final Uint8List image,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadProduct(
        name,
        productId,
        title,
        description,
        price,
        marqueId,
        genre,
        categorieId,
        [],
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
