# KDDockWidgets and Python bindings

These are the instructions for building the Python bindings for KDDockWidgets.

Make sure you have PySide2, shiboken2 and shiboken2-generator installed.
As this time, you cannot get shiboken2-generator because the wheels are not on PyPi.
To use the wheels do this:

A C++17 compliant C++ compiler is also required.

```bash
% python3 -m pip install \
    --index-url=http://download.qt.io/official_releases/QtForPython/ \
    --trusted-host download.qt.io \
    shiboken2 pyside2 shiboken2_generator
```

For more info visit <https://doc.qt.io/qtforpython/shiboken2/gettingstarted.html>.

afterwards run 'python3 -m pip list | grep PySide2'
Note the version *must* match the same Qt you intend to use when building KDDockWidgets.

Not supported:

- debug builds
- static builds
- python2 bindings
- only some 32-bit platforms are supported (see <https://wiki.qt.io/Qt_for_Python>)

Tell CMake to build the bindings by passing the `-DKDDockWidgets_PYTHON_BINDINGS=True' option,
followed by the make command.

The bindings will be installed to the passed `-DCMAKE_INSTALL_PREFIX`, which
might require setting the `PYTHONPATH` env variable to point to that path when
running applications.  Alternatively, configure the bindings install location
by passing `-DKDDockWidgets_PYTHON_BINDINGS_INSTALL_PREFIX=/usr/lib/python3.9/site-packages`
to CMake (adjust to the python path on your system).

To run the KDDW python example

```bash
    export PYTHONPATH=/kddw/install/path # Only if needed
    cd python/examples/
    rcc -g python -o rc_assets.py ../../examples/dockwidgets/resources_example.qrc
    python3 main.py
```

Build Issues

- You can override the default Python3 version found by CMake (usually the
  newest version available) by passing the Python3_EXECUTABLE value to CMake,
  i.e.

```bash
    cmake -DPython3_EXECUTABLE=/usr/bin/python3.10 ....
```

- If you see errors like "Unable to locate Clang's built-in include directory"
  then first make sure you have llvm installed.  If you still have problems try
  setting the environment variable `LLVM_INSTALL_DIR` to point to your llvm installation.

  Examples:

```bash
    export LLVM_INSTALL_DIR=/usr/local/opt/llvm-15
    set "LLVM_INSTALL_DIR=C:\Program Files\LLVM" #Windows
```

- When building the examples you may encounter errors loading shared libraries from shiboken2_generator.

  Try:

```bash
    export LD_LIBRARY_PATH=/usr/local/lib/python/dist-packages/PySide2/Qt/lib #linux
    export DYLD_LIBRARY_PATH=/usr/local/lib/python/dist-packages/PySide2/Qt/lib #Mac
    (Adjust to wherever your PySide is installed)
```

- On Windows the `libclang.dll` that ships with QtForPython is not compatible with MSVC2.
  To fix this, copy the `libclang.dll` that comes with llvm into shiboken2, like so:

```bash
    cd C:\Python39\Lib\site-packages\shiboken2_generator
    copy libclang.dll libclang.dll.save
    copy "C:\Program Files\llvm\bin\libclang.dll" libclang.dll
    (Python3 installation in C:\Python39 and llvm in c:\Program Files\llvm. adjust as needed)
```

- On macOS if you see `cstdlib:145:9: error: no member named quick_exit` in the
  global namespace with XCode 15, try making the `SDKROOT` env variable point to
  the XCode 14.2 SDK or download a more recent PySide6.
