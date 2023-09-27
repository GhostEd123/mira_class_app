// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRequest extends StatefulWidget {
  const ApiRequest({super.key});

  @override
  State<ApiRequest> createState() => _ApiRequestState();
}

class _ApiRequestState extends State<ApiRequest> {
  dynamic getTask;
  Future<Map<String, dynamic>> fetchRandomUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load random user');
    }
  }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getTask = fetchRandomUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Expanded(
                child: FutureBuilder(
              future: fetchRandomUser(),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: SizedBox(
                          height: 20,
                          child:
                              CircularProgressIndicator())); // Show loading indicator while fetching data.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!["results"][0]["picture"]
                                  ["medium"]), // Display user's image
                        ),
                        title: Text(
                            "${snapshot.data!["results"][0]["name"]["title"]} ${snapshot.data!["results"][0]["name"]["first"]}"),
                        subtitle:
                            Text("${snapshot.data!["results"][0]["email"]}"),
                        // You can add more ListTile properties and customize it further
                      );
                    },
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
