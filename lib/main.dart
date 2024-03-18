import 'dart:convert';

import 'package:api_flutter_rozarpay/rayzorpay_insert_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'customer_datamodel.dart';

// Function to fetch data from the API
// Future<RazorPayModel> fetchData() async {
Future<List<Item>> fetchData() async {
  String username = 'rzp_test_spCetGguNd0T6X';
  String password = 'z1ibOqW8JOo5sjDpqQ7bR3RL';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  // final response = await http.get(Uri.parse('https://api.razorpay.com/v1/customers'), headers: {
  //   "Authorization" :basicAuth
  // });
  final response = await http.get(Uri.parse('https://api.razorpay.com/v1/customers'), headers: {
    "Authorization" :basicAuth
  },
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);

    List<dynamic> items = data['items'];
    var itemList = items.map((e) => Item.fromJson(e)).toList();
    return itemList;
    // return  RazorPayModel.fromJson(data);
  } else {
    throw Exception('Failed to load data');
  }
}
Future<String> insertData(RazorPayInsertModel insertData) async {
  // String username = 'rzp_test_spCetGguNd0T6X';
  // String password = 'z1ibOqW8JOo5sjDpqQ7bR3RL';
  String username = 'rzp_test_spCetGguNd0T6X';
  String password = 'z1ibOqW8JOo5sjDpqQ7bR3RL';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  var bodyData = insertData.toJson();
  final response = await http.post(
      Uri.parse('https://api.razorpay.com/v1/customers'),
      headers: {
        "Authorization" :basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(bodyData)// converting model to json
      );


  if (response.statusCode == 200) {

    return response.body;
    // return  RazorPayModel.fromJson(data);
  } else {
    throw Exception('Failed to load data');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API with FutureProvider',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed:()async{
          var insetData = RazorPayInsertModel(name: "rahul kumar",  email: "rahul@gmail.com", contact: "6225963221",  failExisting: "",gstin: "",notes: Notes(notesKey1: "", notesKey2: ""));
         var res = await insertData(insetData);
         print(res);
        },child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text('API with FutureProvider'),
        ),
        body: FutureProvider<List<Item>?>(
          create: (_) => fetchData(),
          catchError: (_, error) {
            print('Error fetching data: $error');
            return null; // Return null in case of an error
          },
          initialData: null, // Set initialData to null or empty list as per requirement
          child: Consumer<List<Item>?>(
            builder: (context, items, _) {
              if (items==null || items.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index].name.toString()),
                      subtitle:Text(items[index].email.toString()),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// final TextEditingController updateNameController = TextEditingController();
// final TextEditingController updateEmailController = TextEditingController();
// final TextEditingController updateContactController = TextEditingController();


// Expanded(
//   child: Consumer<CustomersProvider>(
//     builder: (context, postProvider, _) {
//       List<Customers> posts = postProvider.posts;
//
//       if (posts == null) {
//         return Center(child: CircularProgressIndicator());
//       } else if (posts.isEmpty) {
//         return Center(child: Text('No data available'));
//       } else {
//         return ListView.builder(
//           itemCount: posts.length,
//           itemBuilder: (context, index) {
//             var post = posts[index];
//             return Card(
//               margin: EdgeInsets.all(8.0),
//               child: ListTile(
//                 title: Text(post.title.toString()),
//                 leading: Container(
//                   width: 50,
//                   child: Text(post.body.toString()),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.edit),
//                       onPressed: () {
//                         titleController.text = post.title;
//                         bodyController.text = post.body;
//
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('Update Post'),
//                               content: Column(
//                                 children: [
//                                   TextField(
//                                     controller: updateTitleController,
//                                     decoration: InputDecoration(
//                                         labelText: 'Title'),
//                                   ),
//                                   TextField(
//                                     controller: updateBodyController,
//                                     decoration: InputDecoration(
//                                         labelText: 'Body'),
//                                   ),
//                                 ],
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('Cancel'),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     final updatedPost = Post(
//                                       userId: post.userId,
//                                       id: post.id,
//                                       title: updateTitleController.text,
//                                       body: updateBodyController.text,
//                                     );
//                                     postProvider
//                                         .updatePost(updatedPost, context);
//
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text('Update'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         postProvider.deletePost(post.id, context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     },
//   ),
// ),


// body: Consumer<List<Customers>>(
//   builder: (context, posts, _) {
//     if (posts == null) {
//       return Center(child: CircularProgressIndicator());
//     } else if (posts.isEmpty) {
//       return Center(child: Text('No data available'));
//     } else {
//
//       return FutureBuilder(
//         future: Provider.of<CustomersProvider>(context,listen: false).fetchPosts(),
//         builder: (context, snapshot) =>
//          Container(
//            child:ListView.builder(
//              itemCount: snapshot.length,
//              itemBuilder: (context, index) {
//                var customers = posts[index]?.items;
//
//                if (customers != null && customers.isNotEmpty && index < customers.length) {
//                  return Card(
//                    margin: EdgeInsets.all(8.0),
//                    child: ListTile(
//                      title: Text(customers[index].name ?? 'Name not available'),
//                      leading: Container(
//                        width: 50,
//                        child: Text(customers[index].email ?? 'Email not available'),
//                      ),
//                    ),
//                  );
//                } else {
//                  // Handle the case when there are no customers or index is out of bounds
//                  return Card(
//                    margin: EdgeInsets.all(8.0),
//                    child: ListTile(
//                      title: Text('Name not available'),
//                      leading: Container(
//                        width: 50,
//                        child: Text('Email not available'),
//                      ),
//                    ),
//                  );
//                }
//              },
//            ),
//          )
//       );
//     }
//   },
// ),