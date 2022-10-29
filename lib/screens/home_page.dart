import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mylibrary/screens/bookDetail.dart';

import '../model/librarymodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>
    with
        AutomaticKeepAliveClientMixin<HomePage>,
        TickerProviderStateMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;

  late Future<List<dynamic>> task;
  late Future<List<Library>> future;
  late Future<List<Library>> future2;
  late Future<List<Library>> future3;
  late Future<List<Library>> future4;
  late List<Library> _foundUsers;
  late List<Library> _foundUsers2;
  late List<Library> _foundUsers3;
  late List<Library> _foundUsers4;

  List<Library> _searchResult = [];
  List<Library> _searchResult2 = [];
  List<Library> _searchResult3 = [];

  List<Library> _searchResult4 = [];

  List<Library> _userDetails = [];
  List<Library> _userDetails2 = [];
  List<Library> _userDetails3 = [];

  List<Library> _userDetails4 = [];

  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();

  final ScrollController _scrollController = ScrollController();

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    future = getTitleDetails();
    future2 = getAuthorDetails();
    future3 = getPublisherDetails();
    future4 = getISBNDetails();
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      setState(() {
        _selectedIndex = tabController.index;
      });
      print("Selected Index: " + tabController.index.toString());
    });
  }

  Future<List<Library>> getTitleDetails() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=intitle:Java&maxResults=40"),
      headers: {"Content-Type": "application/json"},
    );
    final responseJson = json.decode(response.body)['items'];

    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _userDetails.add(Library.fromJson(user));
        _foundUsers = _userDetails;
      }
    });

    return _foundUsers;
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((dynamic userDetail) {
      if (userDetail.volumeInfo.title.toString().toLowerCase().contains(text) ||
          userDetail.volumeInfo.authors[0]
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publisher
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publishedDate
              .toString()
              .toLowerCase()
              .contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }

  Future<List<Library>> getAuthorDetails() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=inauthor:Goslin&maxResults=40"),
      headers: {"Content-Type": "application/json"},
    );

    final responseJson = json.decode(response.body)['items'];

    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _userDetails2.add(Library.fromJson(user));
        _foundUsers2 = _userDetails2;
      }
    });

    return _foundUsers2;
  }

  onSearchTextChanged2(String text) async {
    _searchResult2.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails2.forEach((dynamic userDetail) {
      if (userDetail.volumeInfo.title.toString().toLowerCase().contains(text) ||
          userDetail.volumeInfo.authors[0]
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publisher
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publishedDate
              .toString()
              .toLowerCase()
              .contains(text)) _searchResult2.add(userDetail);
    });

    setState(() {});
  }

  Future<List<Library>> getPublisherDetails() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=inpublisher:&maxResults=40"),
      headers: {"Content-Type": "application/json"},
    );

    final responseJson = json.decode(response.body)['items'];

    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _userDetails3.add(Library.fromJson(user));
        _foundUsers3 = _userDetails3;
      }
    });

    return _foundUsers3;
  }

  onSearchTextChanged3(String text) async {
    _searchResult3.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails3.forEach((dynamic userDetail) {
      if (userDetail.volumeInfo.title.toString().toLowerCase().contains(text) ||
          userDetail.volumeInfo.authors[0]
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publisher
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publishedDate
              .toString()
              .toLowerCase()
              .contains(text)) _searchResult3.add(userDetail);
    });

    setState(() {});
  }

  Future<List<Library>> getISBNDetails() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=ISBN_10:123456&maxResults=40"),
      headers: {"Content-Type": "application/json"},
    );

    final responseJson = json.decode(response.body)['items'];

    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _userDetails4.add(Library.fromJson(user));
        _foundUsers4 = _userDetails4;
      }
    });

    return _foundUsers4;
  }

  onSearchTextChanged4(String text) async {
    _searchResult4.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails4.forEach((dynamic userDetail) {
      if (userDetail.volumeInfo.title.toString().toLowerCase().contains(text) ||
          userDetail.volumeInfo.authors[0]
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publisher
              .toString()
              .toLowerCase()
              .contains(text) ||
          userDetail.volumeInfo.publishedDate
              .toString()
              .toLowerCase()
              .contains(text)) _searchResult4.add(userDetail);
    });

    setState(() {});
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 16, top: 100, bottom: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
              child: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (res) {
                      controller.text = res;

                      if (res == controller.text) {
                        onSearchTextChanged(res);
                      }

                      controller2.text = res;
                      if (res == controller2.text) {
                        onSearchTextChanged2(res);
                      }

                      controller3.text = res;
                      if (res == controller3.text) {
                        onSearchTextChanged3(res);
                      }

                      controller4.text = res;
                      if (res == controller4.text) {
                        onSearchTextChanged4(res);
                      }
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    FontAwesomeIcons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isListView = true;
  bool isExpanded = false;
  int _selectedIndex = 0;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
        initialIndex: _selectedIndex,
        length: 4,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: isExpanded == false
                    ? Size.fromHeight(100.0)
                    : Size.fromHeight(200.0),
                child: AppBar(
                  backgroundColor: Color.fromARGB(255, 10, 34, 133),
                  automaticallyImplyLeading: true,
                  title: Padding(
                      padding: EdgeInsets.only(bottom: 30, top: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isListView == true
                                            ? isListView = false
                                            : isListView = true;
                                      });
                                    },
                                    icon: isListView == true
                                        ? Icon(
                                            Icons.list,
                                          )
                                        : Icon(
                                            Icons.grid_view,
                                          ))),
                            Center(child: Text("My Library")),
                            Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isExpanded == false
                                            ? isExpanded = true
                                            : isExpanded = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                    ))),
                          ],
                        ),
                      )),
                  flexibleSpace:
                      isExpanded == false ? Text("") : getSearchBarUI(),
                  bottom: TabBar(
                    isScrollable: true,
                    onTap: (int a) {
                      return tabController.animateTo(_selectedIndex);
                    },
                    controller: tabController,
                    indicator: BoxDecoration(color: Colors.white),
                    tabs: [
                      Tab(
                        child: Text(
                          "Title",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Tab(
                          child: Text(
                        "Author",
                        style: TextStyle(color: Colors.grey),
                      )),
                      Tab(
                          child: Text(
                        "Publisher",
                        style: TextStyle(color: Colors.grey),
                      )),
                      Tab(
                          child: Text(
                        "ISBN",
                        style: TextStyle(color: Colors.grey),
                      ))
                    ],
                  ),
                )),
            body: TabBarView(
              controller: tabController,
              children: [
                TitleScreen(future),
                AuthorScreen(future2),
                PublisherScreen(future3),
                ISBNScreen(future4),
              ],
            )));
  }

  Widget TitleScreen(future) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot) {
          print("data found");

          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Expanded(
                    child: isListView == true
                        ? isListView == true && _searchResult.length != 0 ||
                                controller.text.isNotEmpty
                            ? ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult[index]))),
                                    leading: Image.network(
                                      _searchResult[index]
                                          .volumeInfo
                                          .imageLinks
                                          .smallThumbnail
                                          .toString(),
                                      height: 80,
                                      width: 40,
                                    ),
                                    minVerticalPadding: 10,
                                    title: Text(
                                      _searchResult[index]
                                          .volumeInfo
                                          .title
                                          .toString(),
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult[index]
                                                        .volumeInfo
                                                        .authors[0]
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult[index]
                                                        .volumeInfo
                                                        .publisher
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult[index]
                                                        .volumeInfo
                                                        .publishedDate
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20)),
                                                ]),
                                          ),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                              )
                            : SingleChildScrollView(
                                //  scrollDirection: Axis.vertical,
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails[
                                                                  index]))),
                                          leading: Image.network(
                                            _userDetails[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 80,
                                            width: 40,
                                          ),
                                          minVerticalPadding: 10,
                                          title: Text(
                                            _userDetails[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails[index]
                                                              .volumeInfo
                                                              .authors[0]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails[index]
                                                              .volumeInfo
                                                              .publisher
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails[index]
                                                              .volumeInfo
                                                              .publishedDate
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        20)),
                                                      ]),
                                                ),
                                              ]),
                                          contentPadding: EdgeInsets.all(5.0),
                                        ));
                                      },
                                    )))
                        : isListView == false && _searchResult.length != 0 ||
                                controller.text.isNotEmpty
                            ? GridView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(10),
                                itemCount: _searchResult.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult[index]))),
                                    minVerticalPadding: 10,
                                    subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            _searchResult[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 170,
                                            width: 80,
                                          ),
                                          Expanded(
                                              child: Text(
                                            _searchResult[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(10),
                                      itemCount: _userDetails.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails[
                                                                  index]))),
                                          minVerticalPadding: 5,
                                          subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  _userDetails[index]
                                                      .volumeInfo
                                                      .imageLinks
                                                      .smallThumbnail
                                                      .toString(),
                                                  height: 170,
                                                  width: 80,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  _userDetails[index]
                                                      .volumeInfo
                                                      .title
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                              ]),
                                        ));
                                      },
                                    ))))
              ]));
        });
  }

  Widget AuthorScreen(future2) {
    return FutureBuilder(
        future: future2,
        builder: (context, AsyncSnapshot snapshot) {
          print("data found");

          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Expanded(
                    child: isListView == true
                        ? isListView == true && _searchResult2.length != 0 ||
                                controller2.text.isNotEmpty
                            ? ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult2.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    leading: Image.network(
                                      _searchResult2[index]
                                          .volumeInfo
                                          .imageLinks
                                          .smallThumbnail
                                          .toString(),
                                      height: 80,
                                      width: 40,
                                    ),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult2[index]))),
                                    minVerticalPadding: 10,
                                    title: Text(
                                      _searchResult2[index]
                                          .volumeInfo
                                          .title
                                          .toString(),
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult2[index]
                                                        .volumeInfo
                                                        .authors[0]
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult2[index]
                                                        .volumeInfo
                                                        .publisher
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult2[index]
                                                        .volumeInfo
                                                        .publishedDate
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20)),
                                                ]),
                                          ),
                                        ]),
                                    contentPadding: const EdgeInsets.all(5.0),
                                  ));
                                },
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails2.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          leading: Image.network(
                                            _userDetails2[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 80,
                                            width: 40,
                                          ),
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails2[
                                                                  index]))),
                                          minVerticalPadding: 10,
                                          title: Text(
                                            _userDetails2[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails2[index]
                                                              .volumeInfo
                                                              .authors[0]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails2[index]
                                                              .volumeInfo
                                                              .publisher
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails2[index]
                                                              .volumeInfo
                                                              .publishedDate
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        20)),
                                                      ]),
                                                ),
                                              ]),
                                          contentPadding:
                                              const EdgeInsets.all(5.0),
                                        ));
                                      },
                                    )))
                        : isListView == false && _searchResult2.length != 0 ||
                                controller2.text.isNotEmpty
                            ? GridView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult2.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult2[index]))),
                                    minVerticalPadding: 10,
                                    subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            _searchResult2[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 170,
                                            width: 80,
                                          ),
                                          Expanded(
                                              child: Text(
                                            _searchResult2[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails2.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails2[
                                                                  index]))),
                                          minVerticalPadding: 5,
                                          subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  _userDetails2[index]
                                                      .volumeInfo
                                                      .imageLinks
                                                      .smallThumbnail
                                                      .toString(),
                                                  height: 170,
                                                  width: 80,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  _userDetails2[index]
                                                      .volumeInfo
                                                      .title
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                              ]),
                                        ));
                                      },
                                    ))))
              ]));
        });
  }

  Widget PublisherScreen(future3) {
    return FutureBuilder(
        future: future3,
        builder: (context, AsyncSnapshot snapshot) {
          print("data found");

          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Expanded(
                    child: isListView == true
                        ? isListView == true && _searchResult3.length != 0 ||
                                controller3.text.isNotEmpty
                            ? ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult3.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    leading: Image.network(
                                      _searchResult3[index]
                                          .volumeInfo
                                          .imageLinks
                                          .smallThumbnail
                                          .toString(),
                                      height: 80,
                                      width: 40,
                                    ),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult3[index]))),
                                    minVerticalPadding: 10,
                                    title: Text(
                                      _searchResult3[index]
                                          .volumeInfo
                                          .title
                                          .toString(),
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult3[index]
                                                        .volumeInfo
                                                        .authors[0]
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult3[index]
                                                        .volumeInfo
                                                        .publisher
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult3[index]
                                                        .volumeInfo
                                                        .publishedDate
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20)),
                                                ]),
                                          ),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails3.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          leading: Image.network(
                                            _userDetails3[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 80,
                                            width: 40,
                                          ),
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails3[
                                                                  index]))),
                                          minVerticalPadding: 10,
                                          title: Text(
                                            _userDetails3[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails3[index]
                                                              .volumeInfo
                                                              .authors[0]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails3[index]
                                                              .volumeInfo
                                                              .publisher
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails3[index]
                                                              .volumeInfo
                                                              .publishedDate
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        20)),
                                                      ]),
                                                ),
                                              ]),
                                          contentPadding: EdgeInsets.all(5.0),
                                        ));
                                      },
                                    )))
                        : isListView == false && _searchResult3.length != 0 ||
                                controller2.text.isNotEmpty
                            ? GridView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult3.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult3[index]))),
                                    minVerticalPadding: 10,
                                    subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            _searchResult3[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 170,
                                            width: 80,
                                          ),
                                          Expanded(
                                              child: Text(
                                            _searchResult3[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                              )
                            : SingleChildScrollView(
                                //  scrollDirection: Axis.vertical,
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails3.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails3[
                                                                  index]))),
                                          minVerticalPadding: 5,
                                          subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  _userDetails3[index]
                                                      .volumeInfo
                                                      .imageLinks
                                                      .smallThumbnail
                                                      .toString(),
                                                  height: 170,
                                                  width: 80,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  _userDetails3[index]
                                                      .volumeInfo
                                                      .title
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                              ]),
                                        ));
                                      },
                                    ))))
              ]));
        });
  }

  Widget ISBNScreen(future4) {
    return FutureBuilder(
        future: future4,
        builder: (context, AsyncSnapshot snapshot) {
          print("data found");

          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Expanded(
                    child: isListView == true
                        ? isListView == true && _searchResult4.length != 0 ||
                                controller4.text.isNotEmpty
                            ? ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult4.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    leading: Image.network(
                                      _searchResult4[index]
                                          .volumeInfo
                                          .imageLinks
                                          .smallThumbnail
                                          .toString(),
                                      height: 80,
                                      width: 40,
                                    ),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult4[index]))),
                                    minVerticalPadding: 10,
                                    title: Text(
                                      _searchResult4[index]
                                          .volumeInfo
                                          .title
                                          .toString(),
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult4[index]
                                                        .volumeInfo
                                                        .authors[0]
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult4[index]
                                                        .volumeInfo
                                                        .publisher
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5)),
                                                  Text(
                                                    _searchResult4[index]
                                                        .volumeInfo
                                                        .publishedDate
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20)),
                                                ]),
                                          ),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails4.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails4[
                                                                  index]))),
                                          leading: Image.network(
                                            _userDetails4[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 80,
                                            width: 40,
                                          ),
                                          minVerticalPadding: 10,
                                          title: Text(
                                            _userDetails4[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails4[index]
                                                              .volumeInfo
                                                              .authors[0]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails4[index]
                                                              .volumeInfo
                                                              .publisher
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                        Text(
                                                          _userDetails4[index]
                                                              .volumeInfo
                                                              .publishedDate
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        20)),
                                                      ]),
                                                ),
                                              ]),
                                          contentPadding: EdgeInsets.all(5.0),
                                        ));
                                      },
                                    )))
                        : isListView == false && _searchResult4.length != 0 ||
                                controller4.text.isNotEmpty
                            ? GridView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                itemCount: _searchResult4.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: ListTile(
                                    minVerticalPadding: 10,
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookDetail(
                                                    _searchResult4[index]))),
                                    subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            _searchResult4[index]
                                                .volumeInfo
                                                .imageLinks
                                                .smallThumbnail
                                                .toString(),
                                            height: 170,
                                            width: 80,
                                          ),
                                          Expanded(
                                              child: Text(
                                            _searchResult4[index]
                                                .volumeInfo
                                                .title
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ]),
                                    contentPadding: EdgeInsets.all(5.0),
                                  ));
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: _userDetails4.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          BookDetail(
                                                              _userDetails4[
                                                                  index]))),
                                          minVerticalPadding: 5,
                                          subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  _userDetails4[index]
                                                      .volumeInfo
                                                      .imageLinks
                                                      .smallThumbnail
                                                      .toString(),
                                                  height: 170,
                                                  width: 80,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  _userDetails4[index]
                                                      .volumeInfo
                                                      .title
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                              ]),
                                        ));
                                      },
                                    ))))
              ]));
        });
  }
}
