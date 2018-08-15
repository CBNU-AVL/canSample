# canSample
Qt CANBUS sample for ioniq

### Dependency
```
Qt 5.11

```

### Build
```
$ git clone git@github.com:CBNU-AVL/canSample.git --recursive
$ cd canSample
$ mkdir build
$ cd build
$ qmake ..
$ make 
```

### History

18/08/15 - initial commit, just mockup.

### TODO
- [ ] C++/QML Binding
- [ ] Have to implement CAN receive, write w.r.t. DBC(it'll implement using QVariantMap).
- [ ] Real-time Chart for selected signal
- [ ] Save seleted data as CSV format
- [ ] Simple PD-Controller for vehicle speed control
- [ ] Implement custom QtCANPlugin for mac devices(https://doc.qt.io/qt-5.11/qtcanbus-backends.html)
- [ ] Add waypoiny map display
### Links
DBC Parser - https://github.com/GENIVI/CANdb
