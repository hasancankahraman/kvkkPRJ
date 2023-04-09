// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/post.dart';
import '../db/product.dart';
import '../db/users.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Isar isar;

  List<Users> users = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  addUser(String title, String content) async {
    Users newUsers = Users()
      ..title = title
      ..content = content;

    await isar.writeTxn(() async {
      var addedId = await isar.users.put(newUsers);
      print(addedId);
      getAllNews();
      if (addedId != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Başarıyla Eklendi.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eklenirken Hata Oluştu.'),
          ),
        );
      }
    });
  }

  deleteUser(int id) async {
    isar.writeTxn(() async {
      var result = await isar.users.delete(id);
      if (result) {
        print('Kullanıcı Silindi');
        getAllNews();
      } else {
        print('Kullanıcı  Silinmedi');
      }
    });
  }

  getAllNews() async {
    users = await isar.users.where().findAll();
    setState(() {});
  }

  openConnection() async {
    try {
      isar = await Isar.open([PostSchema, ProductSchema, UsersSchema]);
      if (isar.isOpen) {
        print('Bağantı Başarılı');
        getAllNews();
      } else {
        print('Bağlanadı');
      }
    } catch (e) {
      print('Bağlanma Hatası:');
      print(e);
    }
  }

  closeConnection() async {
    try {
      var result = await isar.close();
      if (result) {
        print('Bağlantınız Başarıyla Kapandı.');
      } else {
        print('Bağlantınız Kapanmadı');
      }
    } catch (e) {
      print('Hata:');
      print(e);
    }
  }

  @override
  void initState() {
    openConnection();
    super.initState();
  }

  @override
  void dispose() {
    closeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    String content = '';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('DB Kullanıcı Ekleme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Kullanıcı Adı ve Soyadı'),
              onChanged: (value) => title = value,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  getAllNews();
                  getAllNews();
                  addUser(title, content);
                  getAllNews();
                  getAllNews();
                },
                child: Text('Kulanıcı Ekle'),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: users
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            //color: Colors.black
                            child: Column(
                              children: [
                                Text("${e.id} ${e.title}"),
                                Text(e.content!),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          deleteUser(e.id);
                                        },
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
