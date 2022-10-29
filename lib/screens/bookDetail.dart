import 'package:flutter/material.dart';
import 'package:mylibrary/model/librarymodel.dart';

class BookDetail extends StatefulWidget {
  Library bookDetails;
  BookDetail(this.bookDetails);
  @override
  State<BookDetail> createState() => _BookDetailState(bookDetails);
}

class _BookDetailState extends State<BookDetail> {
  Library bookDetails;
  _BookDetailState(this.bookDetails);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 34, 133),
          automaticallyImplyLeading: true,

          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Padding(
              padding: EdgeInsets.only(bottom: 30, top: 30, left: 5),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                    Center(child: Text("Book Details")),
                    Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            AlertDialog alert = AlertDialog(
                              actions: [
                                Center(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child:
                                            Text("Book saved successfully"))),
                                Divider(
                                  height: 1,
                                ),
                                Center(
                                    child: TextButton(
                                        child: Text("Ok"),
                                        onPressed: () =>
                                            Navigator.of(context).pop())),
                              ],
                            );

                            showDialog(
                                context: context,
                                builder: ((context) {
                                  return alert;
                                }));
                          },
                        )),
                  ],
                ),
              )),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 10),
            child: Center(
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      bookDetails.volumeInfo.imageLinks.smallThumbnail
                          .toString(),
                      height: 170,
                      width: 80,
                    ),
                    Text(
                      bookDetails.volumeInfo.title.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Subtitle",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.subtitle.toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Authors",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.authors[0].toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Publisher",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.publisher.toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Publication Date",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.publishedDate.toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Language",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.language.toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Pages",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.pageCount.toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          bookDetails.volumeInfo.categories[0].toString(),
                        )),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "ISBN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(alignment: Alignment.topLeft, child: Text("")),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Text(
                      bookDetails.volumeInfo.description.toString(),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Text("Preview on Google Books",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () {
                            bookDetails.volumeInfo.previewLink.toString();
                          },
                        )),
                    Expanded(
                        child: Text(
                      bookDetails.volumeInfo.previewLink.toString(),
                    ))
                  ]),
            )));
  }
}
