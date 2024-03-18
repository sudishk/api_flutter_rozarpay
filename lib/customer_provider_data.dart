import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

import 'customer_createPost_datamodel.dart';
import 'customer_datamodel.dart';

class CustomersProvider extends ChangeNotifier{
  // List<Customers> _posts = [];
  // List<Customers> get posts => _posts;


  // Future<List<Customers>?> fetchPosts() async {
  //   try {
  //     String username = 'rzp_test_spCetGguNd0T6X';
  //     String password = 'z1ibOqW8JOo5sjDpqQ7bR3RL';
  //     String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  //
  //     var response = await http.get(
  //       Uri.parse("https://api.razorpay.com/v1/customers"),
  //       headers: {
  //         'Authorization': basicAuth,
  //       },
  //     );
  //
  //     print("Your data : $response");
  //
  //     if (response.statusCode == 200) {
  //       // Parse the response as dynamic data
  //       print(response.body);
  //       dynamic responseData = jsonDecode(response.body);
  //       List<dynamic> items = responseData["items"] ;
  //       var data= items.map((e) => Customers.fromJson(e)).toList();
  //
  //       return data;
  //     }
  //   } catch (e) {
  //     // Log the error for debugging purposes
  //     print('Error in fetchPosts: $e');
  //     // Re-throw the exception to notify the UI about the error
  //     rethrow;
  //   }
  // }


  // Future<Customers> fetchPosts() async{
  //
  //   try{
  //
  //     var response= await http.get(Uri.parse("https://api.razorpay.com/v1/customers"),headers: {});
  //
  //     if(response.statusCode == 200){
  //       dynamic jsonData= jsonDecode(response.body);
  //       Customers posts= Customers.fromJson(jsonData) ;
  //       return posts;
  //     }
  //     else{
  //       throw Exception ('Failed to load data');
  //     }
  //   }catch(e){
  //     throw Exception("Failed to load data:$e");
  //   }
  //
  // }



  // Method for POST request

// Modify your createPost function


  // Future<Customers> createPost(CustomersCreatePost post, BuildContext context) async {
  //   try {
  //     String username = 'rzp_test_spCetGguNd0T6X';
  //     String password = 'z1ibOqW8JOo5sjDpqQ7bR3RL';
  //     String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  //
  //     var postResponse = await http.post(
  //       Uri.parse("https://api.razorpay.com/v1/customers"),
  //       body: jsonEncode(post.toJson()),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': basicAuth,
  //       },
  //     );
  //
  //     // Print the response for debugging
  //     print('Post Response Body: ${postResponse.body}');
  //     print('Post Response Status Code: ${postResponse.statusCode}');
  //
  //     if (postResponse.statusCode == 201) {
  //       final newPost = Customers.fromJson(jsonDecode(postResponse.body));
  //       _posts.add(newPost); // Add the new post to the list
  //       notifyListeners(); // Notify listeners about the change
  //
  //       // Show a Snackbar
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Post created successfully'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //
  //       return newPost;
  //     } else {
  //       // Throw a more specific error with details
  //       throw Exception('Failed to create post. Status Code: ${postResponse.statusCode}, Body: ${postResponse.body}');
  //     }
  //   } catch (e) {
  //     // Print the error for debugging
  //     print('Error in createPost: $e');
  //
  //     // Throw a more specific error with details
  //     throw Exception('Failed to create post: $e');
  //   }
  // }



  // Future<Customers> createPost(Customers post, BuildContext context) async {
  //   try {
  //     String username = 'rzp_test_spCetGguNd0T6X';
  //     String password = 'z1ibOqW8JOo5sjDpqQ7bR3RL';
  //     String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  //
  //     var postResponse = await http.post(
  //       Uri.parse("https://api.razorpay.com/v1/customers"),
  //       body: jsonEncode(post.toJson()),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': basicAuth,
  //       },
  //     );
  //
  //     // Print the response for debugging
  //     print('Post Response Body: ${postResponse.body}');
  //     print('Post Response Status Code: ${postResponse.statusCode}');
  //
  //     if (postResponse.statusCode == 201) {
  //       final newPost = Customers.fromJson(jsonDecode(postResponse.body));
  //       _posts.add(newPost); // Add the new post to the list
  //       notifyListeners(); // Notify listeners about the change
  //
  //       // Show a Snackbar
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Post created successfully'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //
  //       return newPost;
  //     } else {
  //       // Throw a more specific error with details
  //       throw Exception('Failed to create post. Status Code: ${postResponse.statusCode}, Body: ${postResponse.body}');
  //     }
  //   } catch (e) {
  //     // Print the error for debugging
  //     print('Error in createPost: $e');
  //
  //     // Throw a more specific error with details
  //     throw Exception('Failed to create post: $e');
  //   }
  // }



// Method for PUT request


  // Future<Customers> updatePost(Customers post,BuildContext context) async {
  //   try {
  //     var putResponse = await http.put(
  //       Uri.parse("https://jsonplaceholder.typicode.com/posts/${post.id}"),
  //       body: jsonEncode(post.toJson()),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //
  //     print("PUT response status code: ${putResponse.statusCode}");
  //     print("PUT response body: ${putResponse.body}");
  //
  //     if (putResponse.statusCode == 200) {
  //       final replacedPost = Customers.fromJson(jsonDecode(putResponse.body));
  //       int index = _posts.indexWhere((p) => p.id == replacedPost.id);
  //
  //       if (index != -1) {
  //         _posts[index] = replacedPost; // Update the post in the list
  //         notifyListeners(); // Notify listeners about the change
  //
  //         // Show a Snackbar
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Post update successfully'),
  //             duration: Duration(seconds: 2), // You can adjust the duration as needed
  //           ),
  //         );
  //
  //         return replacedPost;
  //       } else {
  //         print("Post with id ${replacedPost.id} not found in the list.");
  //         throw Exception('Failed to replace post: Post not found');
  //       }
  //     } else {
  //       print("PUT request failed with status code ${putResponse.statusCode}");
  //       throw Exception('Failed to replace post');
  //     }
  //   } catch (e) {
  //     print('Failed to replace post: $e');
  //     throw Exception('Failed to replace post: $e');
  //   }
  // }


}
