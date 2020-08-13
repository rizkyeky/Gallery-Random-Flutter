import 'package:rxdart/rxdart.dart';
import 'Controller.dart';

class SearchBloc extends Controller {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    _activeSearch = false;
    _searchController.sink.add(_activeSearch);
  }

  final BehaviorSubject<bool> _searchController = BehaviorSubject();
  Stream<bool> get searchStream => _searchController.stream;

  bool _activeSearch;  
  bool get activeSearch => _activeSearch;

  void switchSearch() {
    if (_activeSearch) {
      _activeSearch = false;
    } else {
      _activeSearch = true;
    }
    _searchController.sink.add(_activeSearch);
  }
}