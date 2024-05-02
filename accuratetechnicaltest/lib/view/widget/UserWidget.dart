import 'package:accuratetechnicaltest/model/UserApi.dart';
import 'package:accuratetechnicaltest/view/page/UserPostPage.dart';
import 'package:accuratetechnicaltest/viewmodel/UserViewModel.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  final UserViewModel _userViewModel = UserViewModel();
  late Future<List<UserApi>> _usersFuture;
  late Future<List<UserApi>> _searchResult;
  bool isSearching = false;
  bool _isAscending = true;
  double _scale = 1.0;

  void applySearchFilter(String value) {
    setState(() {
      _searchResult = _usersFuture.then((users) => users
          .where((user) =>
              user.id!.toString().contains(value) ||
              user.name!.toLowerCase().contains(value.toLowerCase()) ||
              user.email!.toLowerCase().contains(value.toLowerCase()) ||
              user.address!.toLowerCase().contains(value.toLowerCase()) ||
              user.city!.toLowerCase().contains(value.toLowerCase()) ||
              user.phoneNumber!.toLowerCase().contains(value.toLowerCase()))
          .toList());
    });
  }

  void initState() {
    super.initState();
    _usersFuture = _userViewModel.fetchUsers();
    _searchResult = _usersFuture;
  }

  void _search() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        _searchResult = _usersFuture;
      }
    });
  }

  void _sortUsers() {
    setState(() {
      _isAscending = !_isAscending;
      _searchResult = _searchResult.then((users) {
        if (_isAscending) {
          return users
            ..sort((a, b) {
              String nameA = a.name?.isNotEmpty == true ? a.name! : "zzzzz";
              String nameB = b.name?.isNotEmpty == true ? b.name! : "zzzzz";
              nameA = nameA.toLowerCase();
              nameB = nameB.toLowerCase();
              return nameA.compareTo(nameB);
            });
        } else {
          return users
            ..sort((a, b) {
              String nameA = a.name?.isNotEmpty == true ? a.name! : "zzzzz";
              String nameB = b.name?.isNotEmpty == true ? b.name! : "zzzzz";
              nameA = nameA.toLowerCase();
              nameB = nameB.toLowerCase();
              return nameB.compareTo(nameA);
            });
        }
      });
    });
  }

  void _filterByFromCityUser(String city) {
    setState(() {
      _searchResult = _usersFuture.then((users) => users
          .where((user) =>
              user.city != null &&
              user.city!.toLowerCase() == city.toLowerCase())
          .toList());
    });
  }

  void _showFilterCity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose City'),
          content: Container(
            width: double.maxFinite,
            child: FutureBuilder<List<String>>(
              future: _userViewModel.fetchAvailableCities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<String> cities = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      String city = cities[index];
                      return ListTile(
                        title: Text(city),
                        onTap: () {
                          _filterByFromCityUser(city);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showUserPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserPostPage();
      },
    );
  }

  void _refreshData() {
    setState(() {
      _usersFuture = _userViewModel.fetchUsers();
      _searchResult = _usersFuture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Cari Nama Doi',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  applySearchFilter(value);
                },
              )
            : Text('User Data'),
        actions: [
          IconButton(
              icon: isSearching ? Icon(Icons.cancel) : Icon(Icons.search),
              onPressed: _search),
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: _sortUsers,
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: _showFilterCity,
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<List<UserApi>>(
            future: _searchResult,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<UserApi> users = snapshot.data ?? [];
                return InteractiveViewer(
                  transformationController: TransformationController()
                    ..value = Matrix4.diagonal3Values(_scale, _scale, 1.0),
                  minScale: 0.01,
                  maxScale: 7.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Address')),
                        DataColumn(label: Text('City')),
                        DataColumn(label: Text('Phone number')),
                      ],
                      rows: users.map((user) {
                        return DataRow(cells: [
                          DataCell(Text(user.name?.isEmpty == true
                              ? 'empty'
                              : user.name!)),
                          DataCell(Text(user.email?.isEmpty == true
                              ? 'empty'
                              : user.email!)),
                          DataCell(Text(user.address?.isEmpty == true
                              ? 'empty'
                              : user.address!)),
                          DataCell(Text(user.city?.isEmpty == true
                              ? 'empty'
                              : user.city!)),
                          DataCell(Text(user.phoneNumber?.isEmpty == true
                              ? 'empty'
                              : user.phoneNumber!)),
                        ]);
                      }).toList(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showUserPostDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
