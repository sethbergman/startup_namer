import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';
import 'package:english_words/english_words.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [CORE_DIRECTIVES, materialDirectives],
  providers: const [materialProviders],
)
class AppComponent implements OnInit {
  var names = <WordPair>[];
  final savedNames = new Set<WordPair>();

  void generateNames() {
    names = generateWordPairs().take(5).toList();
  }

  @override
  void ngOnInit() {
    generateNames();
  }

  void addToSaved(WordPair name) {
    savedNames.add(name);
  }

  void removeFromSaved(WordPair name) {
    savedNames.remove(name);
  }

  void toggleSavedState(WordPair name) {
    if (savedNames.contains(name)) {
      removeFromSaved(name);
      return;
    }
    addToSaved(name);
  }
}