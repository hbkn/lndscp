library app_router;

import 'package:angular/angular.dart';

class AppRouteInitializer implements RouteInitializer {

  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
          defaultRoute: true,          
          name: 'applications',
          path: '/applications',
          enter: view('view/applications.html'))
      ..addRoute(
          name: 'services',
          path: '/services',
          enter: view('view/services.html'))
              ..addRoute(
                  name: 'people',
                  path: '/people',
                  enter: view('view/people.html'))
      ..addRoute(
          name: 'newAppComp',
          path: '/newAppComp',
          enter: view('view/newAppComp.html'))

              ..addRoute(
                name: 'service',
                path: '/service/:id',
                mount: (Route route) => route
                ..addRoute(
                    name: 'view',
                    path: '/view',
                    enter: view('view/viewService.html'))
                      ..addRoute(
                          name: 'edit',
                          path: '/edit',
                          enter: view('view/editService.html'))
                            ..addRoute(
                                name: 'view_default',
                                defaultRoute: true,
                                enter: (_) =>
                                    router.go('view', {'id': ':id'},
                                        startingFrom: route, replace:true)))
            ..addRoute(
                name: 'appComp',
                path: '/appComp/:id',
                mount: (Route route) => route
                ..addRoute(
                    name: 'view',
                    path: '/view',
                    enter: view('view/viewAppComp.html'))
                      ..addRoute(
                          name: 'edit',
                          path: '/edit',
                          enter: view('view/editAppComp.html'))
                            ..addRoute(
                                name: 'view_default',
                                defaultRoute: true,
                                enter: (_) =>
                                    router.go('view', {'id': ':id'},
                                        startingFrom: route, replace:true)))
                                        
                                        
                                   
              ..addRoute(
           name: 'person',
           path: '/person/:id',
           mount: (Route route) => route
           ..addRoute(
               name: 'view',
               path: '/view',
               enter: view('view/viewPerson.html'))
                 ..addRoute(
                     name: 'edit',
                     path: '/edit',
                     enter: view('view/editPerson.html'))
                       ..addRoute(
                           name: 'view_default',
                           defaultRoute: true,
                           enter: (_) =>
                               router.go('view', {'id': ':id'},
                                        startingFrom: route, replace:true)));
                                        
                                        
  }
}
