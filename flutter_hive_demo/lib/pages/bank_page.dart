import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/pages/add_bank_page.dart';
import 'package:flutter_hive_demo/pages/add_student_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/bank_models.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {

  late Box<Bank> bankBox;

  @override
  void initState() {
    super.initState();
    bankBox = Hive.box('Banks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: bankBox.listenable(), 
        builder: ((context, value, child) {
          return ListView.builder(
            itemCount: bankBox.length,
            itemBuilder: (((context, index) {
              final bank = bankBox.getAt(index) as Bank;
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bank.id.toString()),
                      Text(bank.name.toString()),
                      Text(bank.amount.toString()),
                    ],
                  ),
                ),
              );
            }))
          );
        })
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ADDBankScreen()));
        }, 
        label: const Text('Save'),
        icon: Icon(Icons.save),
      ),
    );
  }
}