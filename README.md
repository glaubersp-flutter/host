# host

Host app

## Flutter Test Driver and integration tests

Packages can export only files inside /lib and /bin folders.

To allow driver_test files to be written inside each sub-app project and used by the host app, a file must be created inside each sub-app /lib folder to export only the tests and allow them to be imported in the host test file.
The downside of this approach is that the tests will be exported to the users of the library (in this case, the host can see the driver_test files but not the other tests from the app2, for example.)

Another option would be to create a new package to contain the tests for each sub-app, but this option has a higher complexity and may face dependency problems.

To execute the integration tests:

    cd host/
    flutter drive --target=test_driver/app.dart
