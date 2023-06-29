// main.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_page2.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Depense Malin',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AutPage2(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> expenses = [];

  //recuperation d'info d'utilisateur

  final user = FirebaseAuth.instance.currentUser!;

  //pour la deconnexion
  void singUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _addExpense() async {
    final result = await showDialog(
      context: context,
      builder: (_) => AddExpenseDialog(),
    );

    if (result != null) {
      setState(() {
        expenses.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('Depense malin'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: singUserOut,
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Recherchez vos dépenses',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: null,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'email connecté: ${user.email} 🤣',
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Colors.blueGrey,
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddExpenseDialog extends StatefulWidget {
  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final TextEditingController _expenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter une dépense'),
      content: TextField(
        controller: _expenseController,
        decoration: InputDecoration(
          labelText: 'Dépense',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            final String expense = _expenseController.text;

            if (expense.isNotEmpty) {
              Navigator.of(context).pop(expense);
            } else {
              // Afficher une erreur ou une indication invalide
            }
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
