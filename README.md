# Ded Note Package

Un package Flutter simple et efficace pour la gestion de notes avec stockage local SQLite.

## Fonctionnalités

- Création, lecture, modification et suppression de notes (CRUD)
- Stockage persistant avec SQLite
- Structure de données simple et intuitive
- Gestion asynchrone des opérations de base de données

## Installation

Ajoutez ces dépendances à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  note: ^1.0.0
  sqflite: ^2.4.0
  path_provider: ^2.1.4
  path: ^1.9.0
```

## Utilisation

### Initialisation

```dart
import 'package:ded_note/note.dart';

// Créez une instance du DatabaseHelper
final dbHelper = DatabaseHelper();
```

### Création d'une note

```dart
final note = Note(
  title: 'Ma première note',
  body: 'Contenu de la note',
  date: DateTime.now().toString(),
);

// Ajouter la note dans la base de données
await dbHelper.addNote(note);
```

### Récupération des notes

```dart
// Récupérer toutes les notes
List<Note> notes = await dbHelper.getAllNotes();
```

### Mise à jour d'une note

```dart
final noteToUpdate = Note(
  id: 1, // ID de la note à mettre à jour
  title: 'Titre modifié',
  body: 'Nouveau contenu',
  date: DateTime.now().toString(),
);

await dbHelper.updateNote(noteToUpdate);
```

### Suppression d'une note

```dart
// Supprimer une note spécifique
await dbHelper.deleteNote(note);

// Supprimer toutes les notes
await dbHelper.deleteAllNotes();
```

## Structure des données

### Classe Note

```dart
class Note {
  int? id;           // ID unique de la note (auto-incrémenté)
  String title;      // Titre de la note
  String body;       // Contenu de la note
  String date;       // Date de création/modification
}
```

## Exemple complet

```dart
void main() async {
  final dbHelper = DatabaseHelper();
  
  // Créer une nouvelle note
  final newNote = Note(
    title: 'Courses',
    body: 'Acheter du lait',
    date: DateTime.now().toString(),
  );
  
  // Ajouter la note
  await dbHelper.addNote(newNote);
  
  // Récupérer toutes les notes
  List<Note> allNotes = await dbHelper.getAllNotes();
  
  // Afficher les notes
  for (var note in allNotes) {
    print('${note.title}: ${note.body}');
  }
}
```

## Configuration requise

- Flutter SDK: >=1.17.0
- Dart SDK: >=3.5.3

## Dépendances

- sqflite: ^2.3.0
- path_provider: ^2.1.0
- path: ^1.8.3

## Licence

Ce projet est sous licence MIT.

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commiter vos changements
4. Pusher vers la branche
5. Ouvrir une Pull Request

## Support

Si vous rencontrez des problèmes ou avez des questions, n'hésitez pas à ouvrir une issue sur le dépôt GitHub.