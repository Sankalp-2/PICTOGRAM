// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // class UserPage extends StatelessWidget {
// //   const UserPage({Key? key}) : super(key: key);

// //   // Function to update user status and show popup notification
// //   void updateUserStatus(String userId, String status, BuildContext context) {
// //     FirebaseFirestore.instance.collection('users').doc(userId).update({
// //       'status': status,
// //       'tasksEnabled':
// //           status == 'unblocked', // Assuming 'tasksEnabled' is a boolean field
// //     });

// //     // Show notification in user tasks section
// //     FirebaseFirestore.instance.collection('user_tasks').add({
// //       'userId': userId,
// //       'message': status == 'unblocked' ? 'User unblocked' : 'User blocked',
// //       'timestamp': DateTime.now(),
// //     });

// //     // Show popup notification
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(
// //           status == 'unblocked' ? 'User unblocked' : 'User blocked',
// //           style: const TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Color.fromARGB(255, 170, 24, 228),
// //           ),
// //         ),
// //         duration: const Duration(seconds: 2),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'MANAGE USER',
// //           style: TextStyle(
// //             fontSize: 30,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: StreamBuilder(
// //         stream: FirebaseFirestore.instance.collection('users').snapshots(),
// //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           } else if (snapshot.hasError) {
// //             return const Center(
// //               child: Text('Error fetching data'),
// //             );
// //           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //             return const Center(
// //               child: Text('No data available'),
// //             );
// //           } else {
// //             return ListView.builder(
// //               itemCount: snapshot.data!.docs.length,
// //               itemBuilder: (context, index) {
// //                 var userData =
// //                     snapshot.data!.docs[index].data() as Map<String, dynamic>;
// //                 String userId = snapshot.data!.docs[index].id;

// //                 return Container(
// //                   width: double.infinity,
// //                   padding: const EdgeInsets.all(10),
// //                   margin: const EdgeInsets.symmetric(vertical: 5),
// //                   decoration: BoxDecoration(
// //                     color: const Color.fromARGB(255, 0, 255, 242),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         "USERNAME: ${userData['username']}",
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Color.fromARGB(255, 255, 0, 251),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 5),
// //                       Text(
// //                         "EMAIL: ${userData['email']}",
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Color.fromARGB(255, 170, 24, 228),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 10),
// //                       Text(
// //                         "BIO: ${userData['bio']}",
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Color.fromARGB(255, 63, 72, 200),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 10),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.end,
// //                         children: [
// //                           ElevatedButton(
// //                             onPressed: () => updateUserStatus(
// //                                 userId,
// //                                 userData['status'] == 'unblocked'
// //                                     ? 'blocked'
// //                                     : 'unblocked',
// //                                 context),
// //                             child: Text(userData['status'] == 'unblocked'
// //                                 ? 'Block'
// //                                 : 'UnBlock'),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserPage extends StatelessWidget {
//   const UserPage({Key? key}) : super(key: key);

//   // Function to update user status and show popup notification
//   void updateUserStatus(String userId, String status, BuildContext context) {
//     FirebaseFirestore.instance.collection('users').doc(userId).update({
//       'status': status,
//       'tasksEnabled':
//           status == 'unblocked', // Assuming 'tasksEnabled' is a boolean field
//     });

//     // Show notification in user tasks section
//     FirebaseFirestore.instance.collection('user_tasks').add({
//       'userId': userId,
//       'message': status == 'unblocked' ? 'User unblocked' : 'User blocked',
//       'timestamp': DateTime.now(),
//     });

//     // Show popup notification
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           status == 'unblocked' ? 'User unblocked' : 'User blocked',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         duration: const Duration(seconds: 2),
//         backgroundColor: status == 'unblocked' ? Colors.green : Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'MANAGE USER',
//           style: TextStyle(
//             fontSize: 30,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text('Error fetching data'),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text('No data available'),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 var userData =
//                     snapshot.data!.docs[index].data() as Map<String, dynamic>;
//                 String userId = snapshot.data!.docs[index].id;

//                 return Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(10),
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent, // Changed background color
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "USERNAME: ${userData['username']}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "EMAIL: ${userData['email']}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "BIO: ${userData['bio']}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () => updateUserStatus(
//                                 userId,
//                                 userData['status'] == 'unblocked'
//                                     ? 'blocked'
//                                     : 'unblocked',
//                                 context),
//                             child: Text(userData['status'] == 'unblocked'
//                                 ? 'Block'
//                                 : 'UnBlock'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  // Function to update user status and show popup notification
  void updateUserStatus(String userId, String status, BuildContext context) {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'status': status,
      'tasksEnabled':
          status == 'unblocked', // Assuming 'tasksEnabled' is a boolean field
    });

    // Show notification in user tasks section
    FirebaseFirestore.instance.collection('user_tasks').add({
      'userId': userId,
      'message': status == 'unblocked' ? 'User unblocked' : 'User blocked',
      'timestamp': DateTime.now(),
    });

    // Show popup notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          status == 'unblocked' ? 'User unblocked' : 'User blocked',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: status == 'unblocked' ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MANAGE USER',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var userData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                String userId = snapshot.data!.docs[index].id;

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Changed background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USERNAME: ${userData['username']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "EMAIL: ${userData['email']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "BIO: ${userData['bio']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () => updateUserStatus(
                                userId,
                                userData['status'] == 'unblocked'
                                    ? 'blocked'
                                    : 'unblocked',
                                context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: userData['status'] == 'unblocked'
                                  ? Colors.green // Yellow for 'unblocked'
                                  : Colors.red, // Green for 'blocked'
                            ),
                            child: Text(userData['status'] == 'unblocked'
                                ? 'Block'
                                : 'UnBlock'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
