import 'package:address_book/router.dart';
import 'package:address_book/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import '../utils/constants.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.contacts),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRouter.searchList),
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(Strings.header, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          Flexible(
            child: Container(
              child: GroupedListView<dynamic, String>(
                elements: contacts,
                groupBy: (element) => element[Strings.group],
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) => item1[Strings.name].compareTo(item2[Strings.name]),
                order: GroupedListOrder.DESC,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                itemBuilder: (c, element) {
                  return Card(
                    elevation: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: InkWell(
                        onTap: () => Get.toNamed(AppRouter.contactDetails, arguments: element[Strings.name]),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Icon(
                            Icons.account_circle,
                            size: 30,
                          ),
                          title: Text(
                            element[Strings.name],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(Strings.footer, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
