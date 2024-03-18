// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'customer_crud.dart';
// import 'customer_provider_data.dart'; // Import your CustomersProvider
// import 'customer_datamodel.dart'; // Import your data model
//
// class CustomerHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider<Customers?>(
//       create: (_) => CustomersProvider().fetchPosts(),
//       catchError: (_, error) {
//         print('Error in FutureProvider: $error');
//         return null; // Return null in case of an error
//       },
//       initialData: null, // Set initialData to null or an empty Customers object
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Customer List'),
//         ),
//         body: Consumer<Customers>(
//           builder: (context, posts, _) {
//             if ( posts.items != null) {
//               return Center(child: CircularProgressIndicator());
//             } else if (posts.items!.isEmpty) {
//               return Center(child: Text('No customers found.'));
//             } else {
//               return ListView.builder(
//                 itemCount: posts.items?.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(posts.items![index].name.toString()),
//                       // Add more ListTile content based on your model
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _handleFloatingActionButton(context);
//           },
//           tooltip: 'Create Customer',
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
//
//   void _handleFloatingActionButton(BuildContext context) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCrud()));
//   }
// }
