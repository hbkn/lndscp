import 'package:angular/angular.dart';

    @NgFilter(name:'nameFilter') 
    class NameFilter {
      call(List list, String filterString) {
        if (filterString == '')
          return new List.from(list);
        List result = [];
        if (filterString != null) {
          filterString = filterString.toUpperCase();
          for (var val in list) {
            String name = val.name;
            if (name != null) {
              name = name.toUpperCase();
              if (name.contains(filterString))
                result.add(val);
            }
          }
        }
        return result;
      }
    }