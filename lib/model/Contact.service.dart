import 'dart:async';
import 'package:voyage/model/Contact.dart';
import 'package:voyage/utils/Contact.database.dart';

class ContactService {
  ContactDatabase contactDatabase = ContactDatabase();

  Future<List<Contact>> listeContacts() async {
    var contacts = await contactDatabase.get();
    return contacts.map((item) => Contact.fromJson(item)).toList();
  }
  Future <bool> ajouterContact(Contact c) async {
    int res = await contactDatabase.insert(c);
    return res > 0 ? true : false;
  }
  Future<bool> modifierContact(Contact c) async {
    int res = await contactDatabase.edit(c);
    return res > 0 ? true : false;
  }
  Future<bool> supprimerContact(Contact c ) async {
    int res = await contactDatabase.delete(c);
    return res > 0 ? true : false;
  }

}
