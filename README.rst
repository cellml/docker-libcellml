
Docker files for libCellML
==========================

This repository contains Dockerfiles for creating libCellML build environments.

Setup
=====

To make use of the Docker images for libCellML you will need to download and install `Docker <https://hub.docker.com>`_.  Follow the Docker documentation for installing Docker on your operating system.

With Docker installed there are two Docker images that you can use:

 1. libCellML developer image
 2. libCellML documentation image

To fetch the developer image use the following command::

  docker pull hsorby/libcellml-dev:0.1.1

To fetch the documentation image use the following command::

  docker pull hsorby/libcellml-docs:0.1.0

Running developer image
=======================

::

 docker run hsorby/libcellml-dev https://github.com/cellml/libcellml develop

This will clone, build, and run the unit tests, code coverage, clang-format, and memory checking targets.

You can also build and run the tests from a local directory on the Docker daemon host computer.  This can be achieved with the following command::

  docker run --mount type=bind,src=<your-local-directory>,dst=/external/drive,readonly hsorby/libcellml-dev /external/drive

Hopefully it goes without saying that you need to replace `<your-local-directory>` with the actual directory where the libCellML code you wish to build and test exists.
 
From the command at the top of this section you should get output similar to what is shown in `Appendix A`_

Running documentation image
===========================

::

 docker run -p 8118:8000 hsorby/libcellml-docs https://github.com/cellml/libcellml develop

This will clone, and build the documentation for libCellML and make the documentation available at `localhost:8118 <localhost:8118>`_.

You can also build and serve documentation from a local directory. The documentation will be automatically built and reflected in a webbrowser when any documentation related changes are saved.  This gives you a live rendering of the current state of the libCellML documentation.  This can be achieved with the following command::

 docker run --mount type=bind,src=<your-local-directory>,dst=/external/drive,readonly -p 8118:8000 hsorby/libcellml-docs /external/drive

Hopefully it goes without saying that you need to replace `<your-local-directory>` with the actual directory where the libCellML code you wish to render the documentation for exists.

Appendix A
==========

Output from run of developer image (not verbatim as the codebase may have changed since this output was recorded)::

  -- The CXX compiler identification is GNU 7.4.0
  -- Check for working CXX compiler: /usr/bin/c++
  -- Check for working CXX compiler: /usr/bin/c++ -- works
  -- Detecting CXX compiler ABI info
  -- Detecting CXX compiler ABI info - done
  -- Detecting CXX compile features
  -- Detecting CXX compile features - done
  -- Found Python: /usr/bin/python3.6 (found version "3.6.7") found components:  Interpreter Development 
  -- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE) 
  -- Could NOT find Sphinx (missing: SPHINX_EXECUTABLE) 
  -- Found SWIG: /usr/bin/swig3.0 (found suitable version "3.0.12", minimum required is "3") 
  -- Found LibXml2: /usr/lib/x86_64-linux-gnu/libxml2.so (found version "2.9.4") 
  -- Performing Test COMPILER_HAS_HIDDEN_VISIBILITY
  -- Performing Test COMPILER_HAS_HIDDEN_VISIBILITY - Success
  -- Performing Test COMPILER_HAS_HIDDEN_INLINE_VISIBILITY
  -- Performing Test COMPILER_HAS_HIDDEN_INLINE_VISIBILITY - Success
  -- Performing Test COMPILER_HAS_DEPRECATED_ATTR
  -- Performing Test COMPILER_HAS_DEPRECATED_ATTR - Success
  -- The C compiler identification is GNU 7.4.0
  -- Check for working C compiler: /usr/bin/cc
  -- Check for working C compiler: /usr/bin/cc -- works
  -- Detecting C compiler ABI info
  -- Detecting C compiler ABI info - done
  -- Detecting C compile features
  -- Detecting C compile features - done
  -- Looking for pthread.h
  -- Looking for pthread.h - found
  -- Looking for pthread_create
  -- Looking for pthread_create - not found
  -- Looking for pthread_create in pthreads
  -- Looking for pthread_create in pthreads - not found
  -- Looking for pthread_create in pthread
  -- Looking for pthread_create in pthread - found
  -- Found Threads: TRUE  
  -- Configuring done
  -- Generating done
  -- Build files have been written to: /usr/code/build-libcellml-release
  Scanning dependencies of target gtest
  [  1%] Building CXX object tests/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
  Scanning dependencies of target cellml
  [  1%] Building CXX object src/CMakeFiles/cellml.dir/component.cpp.o
  [  3%] Building CXX object src/CMakeFiles/cellml.dir/componententity.cpp.o
  [  3%] Building CXX object src/CMakeFiles/cellml.dir/entity.cpp.o
  [  3%] Building CXX object src/CMakeFiles/cellml.dir/error.cpp.o
  [  4%] Building CXX object src/CMakeFiles/cellml.dir/importedentity.cpp.o
  [  4%] Building CXX object src/CMakeFiles/cellml.dir/logger.cpp.o
  [  5%] Building CXX object src/CMakeFiles/cellml.dir/namedentity.cpp.o
  [  6%] Building CXX object src/CMakeFiles/cellml.dir/parser.cpp.o
  [  6%] Building CXX object src/CMakeFiles/cellml.dir/orderedentity.cpp.o
  [  6%] Building CXX object src/CMakeFiles/cellml.dir/units.cpp.o
  [  7%] Building CXX object src/CMakeFiles/cellml.dir/model.cpp.o
  [  7%] Building CXX object src/CMakeFiles/cellml.dir/variable.cpp.o
  [  8%] Building CXX object src/CMakeFiles/cellml.dir/version.cpp.o
  [  9%] Building CXX object src/CMakeFiles/cellml.dir/importsource.cpp.o
  [ 10%] Building CXX object src/CMakeFiles/cellml.dir/reset.cpp.o
  [ 11%] Building CXX object src/CMakeFiles/cellml.dir/when.cpp.o
  [ 12%] Building CXX object src/CMakeFiles/cellml.dir/validator.cpp.o
  [ 13%] Building CXX object src/CMakeFiles/cellml.dir/printer.cpp.o
  [ 14%] Building CXX object src/CMakeFiles/cellml.dir/utilities.cpp.o
  [ 14%] Building CXX object src/CMakeFiles/cellml.dir/xmlattribute.cpp.o
  [ 15%] Building CXX object src/CMakeFiles/cellml.dir/xmlnode.cpp.o
  [ 17%] Building CXX object src/CMakeFiles/cellml.dir/xmldoc.cpp.o
  [ 17%] Linking CXX shared library libcellmld.so
  [ 17%] Built target cellml
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  [ 17%] Swig source
  Scanning dependencies of target ___init__
  Scanning dependencies of target _version
  Scanning dependencies of target _specificationrule
  Scanning dependencies of target _enumerations
  [ 18%] Building CXX object src/bindings/python/CMakeFiles/___init__.dir/libcellml/__init__PYTHON_wrap.cxx.o
  [ 19%] Building CXX object src/bindings/python/CMakeFiles/_specificationrule.dir/libcellml/specificationrulePYTHON_wrap.cxx.o
  [ 20%] Building CXX object src/bindings/python/CMakeFiles/_version.dir/libcellml/versionPYTHON_wrap.cxx.o
  [ 21%] Building CXX object src/bindings/python/CMakeFiles/_enumerations.dir/libcellml/enumerationsPYTHON_wrap.cxx.o
  Scanning dependencies of target _validator
  Scanning dependencies of target _logger
  Scanning dependencies of target _when
  Scanning dependencies of target _variable
  Scanning dependencies of target _parser
  Scanning dependencies of target _orderedentity
  [ 22%] Building CXX object src/bindings/python/CMakeFiles/_validator.dir/libcellml/validatorPYTHON_wrap.cxx.o
  [ 23%] Building CXX object src/bindings/python/CMakeFiles/_logger.dir/libcellml/loggerPYTHON_wrap.cxx.o
  [ 24%] Building CXX object src/bindings/python/CMakeFiles/_variable.dir/libcellml/variablePYTHON_wrap.cxx.o
  [ 25%] Building CXX object src/bindings/python/CMakeFiles/_orderedentity.dir/libcellml/orderedentityPYTHON_wrap.cxx.o
  [ 26%] Building CXX object src/bindings/python/CMakeFiles/_when.dir/libcellml/whenPYTHON_wrap.cxx.o
  [ 27%] Building CXX object src/bindings/python/CMakeFiles/_parser.dir/libcellml/parserPYTHON_wrap.cxx.o
  Scanning dependencies of target _importedentity
  Scanning dependencies of target _importsource
  Scanning dependencies of target _component
  Scanning dependencies of target _entity
  [ 28%] Building CXX object src/bindings/python/CMakeFiles/_importsource.dir/libcellml/importsourcePYTHON_wrap.cxx.o
  Scanning dependencies of target _namedentity
  Scanning dependencies of target _reset
  [ 29%] Building CXX object src/bindings/python/CMakeFiles/_component.dir/libcellml/componentPYTHON_wrap.cxx.o
  [ 30%] Building CXX object src/bindings/python/CMakeFiles/_entity.dir/libcellml/entityPYTHON_wrap.cxx.o
  [ 31%] Building CXX object src/bindings/python/CMakeFiles/_importedentity.dir/libcellml/importedentityPYTHON_wrap.cxx.o
  Scanning dependencies of target _printer
  Scanning dependencies of target _componententity
  [ 32%] Building CXX object src/bindings/python/CMakeFiles/_reset.dir/libcellml/resetPYTHON_wrap.cxx.o
  [ 34%] Building CXX object src/bindings/python/CMakeFiles/_namedentity.dir/libcellml/namedentityPYTHON_wrap.cxx.o
  Scanning dependencies of target _error
  [ 35%] Building CXX object src/bindings/python/CMakeFiles/_componententity.dir/libcellml/componententityPYTHON_wrap.cxx.o
  [ 36%] Building CXX object src/bindings/python/CMakeFiles/_printer.dir/libcellml/printerPYTHON_wrap.cxx.o
  [ 37%] Building CXX object src/bindings/python/CMakeFiles/_error.dir/libcellml/errorPYTHON_wrap.cxx.o
  Scanning dependencies of target _model
  Scanning dependencies of target _units
  [ 38%] Building CXX object src/bindings/python/CMakeFiles/_model.dir/libcellml/modelPYTHON_wrap.cxx.o
  [ 39%] Building CXX object src/bindings/python/CMakeFiles/_units.dir/libcellml/unitsPYTHON_wrap.cxx.o
  [ 40%] Linking CXX shared module _specificationrule.so
  [ 41%] Linking CXX shared module ___init__.so
  [ 42%] Linking CXX shared module _enumerations.so
  [ 43%] Linking CXX shared module _version.so
  [ 43%] Built target _specificationrule
  [ 43%] Built target _enumerations
  [ 43%] Built target ___init__
  [ 43%] Built target _version
  [ 44%] Linking CXX shared module _validator.so
  [ 45%] Linking CXX shared module _orderedentity.so
  [ 46%] Linking CXX shared module _importsource.so
  [ 47%] Linking CXX shared module _logger.so
  [ 48%] Linking CXX shared module _parser.so
  [ 50%] Linking CXX shared module _entity.so
  [ 51%] Linking CXX shared module _when.so
  [ 51%] Built target _validator
  [ 52%] Linking CXX shared module _importedentity.so
  [ 53%] Linking CXX shared module _namedentity.so
  [ 53%] Built target _orderedentity
  [ 53%] Built target _logger
  [ 53%] Built target _importsource
  [ 54%] Linking CXX shared module _printer.so
  [ 54%] Built target _parser
  [ 55%] Linking CXX shared module _variable.so
  [ 55%] Built target _importedentity
  [ 55%] Built target _namedentity
  [ 56%] Linking CXX shared library libgtest.so
  [ 56%] Built target _entity
  [ 57%] Linking CXX shared module _reset.so
  [ 57%] Built target _when
  [ 58%] Linking CXX shared module _componententity.so
  [ 58%] Built target _printer
  [ 58%] Built target _variable
  [ 59%] Linking CXX shared module _component.so
  [ 60%] Linking CXX shared module _error.so
  [ 61%] Linking CXX shared module _model.so
  [ 61%] Built target _reset
  [ 61%] Built target gtest
  [ 61%] Built target _componententity
  [ 61%] Built target _component
  Scanning dependencies of target gtest_main
  [ 61%] Built target _error
  [ 61%] Building CXX object tests/gtest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
  [ 61%] Built target _model
  [ 62%] Linking CXX shared module _units.so
  [ 62%] Built target _units
  [ 63%] Linking CXX shared library libgtest_main.so
  [ 63%] Built target gtest_main
  Scanning dependencies of target test_validator
  Scanning dependencies of target test_math
  Scanning dependencies of target test_resolve_imports
  Scanning dependencies of target test_units
  Scanning dependencies of target test_version
  Scanning dependencies of target test_coverage
  Scanning dependencies of target test_connection
  [ 64%] Building CXX object tests/CMakeFiles/test_validator.dir/validator/validator.cpp.o
  [ 65%] Building CXX object tests/CMakeFiles/test_validator.dir/test_utils.cpp.o
  [ 67%] Building CXX object tests/CMakeFiles/test_resolve_imports.dir/resolve_imports/file_parser.cpp.o
  [ 67%] Building CXX object tests/CMakeFiles/test_math.dir/math/math.cpp.o
  Scanning dependencies of target test_when
  Scanning dependencies of target test_reset
  Scanning dependencies of target test_variable
  [ 68%] Building CXX object tests/CMakeFiles/test_math.dir/test_utils.cpp.o
  [ 69%] Building CXX object tests/CMakeFiles/test_version.dir/version/version.cpp.o
  [ 70%] Building CXX object tests/CMakeFiles/test_resolve_imports.dir/test_utils.cpp.o
  Scanning dependencies of target test_printer
  Scanning dependencies of target test_error
  [ 71%] Building CXX object tests/CMakeFiles/test_coverage.dir/test_utils.cpp.o
  [ 71%] Building CXX object tests/CMakeFiles/test_coverage.dir/coverage/coverage.cpp.o
  [ 72%] Building CXX object tests/CMakeFiles/test_version.dir/test_utils.cpp.o
  Scanning dependencies of target test_component
  Scanning dependencies of target test_model
  [ 73%] Building CXX object tests/CMakeFiles/test_units.dir/test_utils.cpp.o
  [ 74%] Building CXX object tests/CMakeFiles/test_reset.dir/reset/reset.cpp.o
  [ 75%] Building CXX object tests/CMakeFiles/test_reset.dir/test_utils.cpp.o
  [ 76%] Building CXX object tests/CMakeFiles/test_units.dir/units/units.cpp.o
  [ 77%] Building CXX object tests/CMakeFiles/test_variable.dir/test_utils.cpp.o
  [ 78%] Building CXX object tests/CMakeFiles/test_when.dir/test_utils.cpp.o
  [ 79%] Building CXX object tests/CMakeFiles/test_variable.dir/variable/variable.cpp.o
  [ 80%] Building CXX object tests/CMakeFiles/test_connection.dir/test_utils.cpp.o
  [ 81%] Building CXX object tests/CMakeFiles/test_error.dir/test_utils.cpp.o
  Scanning dependencies of target test_parser
  [ 81%] Building CXX object tests/CMakeFiles/test_error.dir/error/error.cpp.o
  [ 84%] Building CXX object tests/CMakeFiles/test_model.dir/model/component_import.cpp.o
  [ 84%] Building CXX object tests/CMakeFiles/test_when.dir/when/when.cpp.o
  [ 85%] Building CXX object tests/CMakeFiles/test_component.dir/test_utils.cpp.o
  [ 85%] Building CXX object tests/CMakeFiles/test_connection.dir/connection/connection.cpp.o
  [ 86%] Building CXX object tests/CMakeFiles/test_component.dir/component/component.cpp.o
  [ 87%] Building CXX object tests/CMakeFiles/test_printer.dir/test_utils.cpp.o
  [ 87%] Building CXX object tests/CMakeFiles/test_model.dir/test_utils.cpp.o
  [ 87%] Building CXX object tests/CMakeFiles/test_model.dir/model/model.cpp.o
  [ 87%] Building CXX object tests/CMakeFiles/test_component.dir/component/encapsulation.cpp.o
  [ 88%] Building CXX object tests/CMakeFiles/test_model.dir/model/units_import.cpp.o
  [ 89%] Building CXX object tests/CMakeFiles/test_printer.dir/printer/printer.cpp.o
  [ 89%] Building CXX object tests/CMakeFiles/test_parser.dir/parser/file_parser.cpp.o
  [ 90%] Building CXX object tests/CMakeFiles/test_parser.dir/parser/parser.cpp.o
  [ 91%] Building CXX object tests/CMakeFiles/test_parser.dir/test_utils.cpp.o
  [ 92%] Building CXX object tests/CMakeFiles/test_parser.dir/parser/libxml_user.cpp.o
  [ 93%] Linking CXX executable test_when
  [ 93%] Linking CXX executable test_version
  [ 94%] Linking CXX executable test_math
  [ 94%] Built target test_math
  [ 94%] Built target test_when
  [ 94%] Built target test_version
  [ 94%] Linking CXX executable test_printer
  [ 94%] Linking CXX executable test_resolve_imports
  [ 94%] Built target test_printer
  [ 95%] Linking CXX executable test_component
  [ 95%] Built target test_resolve_imports
  [ 95%] Built target test_component
  [ 96%] Linking CXX executable test_coverage
  [ 97%] Linking CXX executable test_connection
  [ 97%] Linking CXX executable test_units
  [ 97%] Linking CXX executable test_reset
  [ 98%] Linking CXX executable test_model
  [ 98%] Linking CXX executable test_variable
  [ 98%] Built target test_connection
  [ 98%] Built target test_coverage
  [ 98%] Built target test_units
  [ 98%] Built target test_reset
  [ 98%] Linking CXX executable test_validator
  [ 98%] Built target test_model
  [100%] Linking CXX executable test_error
  [100%] Built target test_variable
  [100%] Built target test_validator
  [100%] Built target test_error
  [100%] Linking CXX executable test_parser
  [100%] Built target test_parser
  Running tests...
  Test project /usr/code/build-libcellml-release
        Start  1: entities_unit_test_component
   1/34 Test  #1: entities_unit_test_component .....   Passed    0.02 sec
        Start  2: entities_unit_test_connection
   2/34 Test  #2: entities_unit_test_connection ....   Passed    0.01 sec
        Start  3: misc_unit_test_coverage
   3/34 Test  #3: misc_unit_test_coverage ..........   Passed    0.01 sec
        Start  4: object_unit_test_error
   4/34 Test  #4: object_unit_test_error ...........   Passed    0.01 sec
        Start  5: entities_unit_test_math
   5/34 Test  #5: entities_unit_test_math ..........   Passed    0.01 sec
        Start  6: entities_unit_test_model
   6/34 Test  #6: entities_unit_test_model .........   Passed    0.01 sec
        Start  7: io_unit_test_parser
   7/34 Test  #7: io_unit_test_parser ..............   Passed    0.05 sec
        Start  8: io_unit_test_printer
   8/34 Test  #8: io_unit_test_printer .............   Passed    0.01 sec
        Start  9: entities_unit_test_reset
   9/34 Test  #9: entities_unit_test_reset .........   Passed    0.01 sec
        Start 10: io_unit_test_resolve_imports
  10/34 Test #10: io_unit_test_resolve_imports .....   Passed    0.06 sec
        Start 11: entities_unit_test_units
  11/34 Test #11: entities_unit_test_units .........   Passed    0.01 sec
        Start 12: io_unit_test_validator
  12/34 Test #12: io_unit_test_validator ...........   Passed    2.66 sec
        Start 13: entities_unit_test_variable
  13/34 Test #13: entities_unit_test_variable ......   Passed    0.01 sec
        Start 14: api_unit_test_version
  14/34 Test #14: api_unit_test_version ............   Passed    0.01 sec
        Start 15: entities_unit_test_when
  15/34 Test #15: entities_unit_test_when ..........   Passed    0.01 sec
        Start 16: python_test_component
  16/34 Test #16: python_test_component ............   Passed    0.14 sec
        Start 17: python_test_component_entity
  17/34 Test #17: python_test_component_entity .....   Passed    0.06 sec
        Start 18: python_test_entity
  18/34 Test #18: python_test_entity ...............   Passed    0.06 sec
        Start 19: python_test_error
  19/34 Test #19: python_test_error ................   Passed    0.06 sec
        Start 20: python_test_import_source
  20/34 Test #20: python_test_import_source ........   Passed    0.06 sec
        Start 21: python_test_imported_entity
  21/34 Test #21: python_test_imported_entity ......   Passed    0.06 sec
        Start 22: python_test_logger
  22/34 Test #22: python_test_logger ...............   Passed    0.06 sec
        Start 23: python_test_model
  23/34 Test #23: python_test_model ................   Passed    0.07 sec
        Start 24: python_test_named_entity
  24/34 Test #24: python_test_named_entity .........   Passed    0.06 sec
        Start 25: python_test_ordered_entity
  25/34 Test #25: python_test_ordered_entity .......   Passed    0.06 sec
        Start 26: python_test_parser
  26/34 Test #26: python_test_parser ...............   Passed    0.06 sec
        Start 27: python_test_printer
  27/34 Test #27: python_test_printer ..............   Passed    0.06 sec
        Start 28: python_test_reset
  28/34 Test #28: python_test_reset ................   Passed    0.06 sec
        Start 29: python_test_units
  29/34 Test #29: python_test_units ................   Passed    0.06 sec
        Start 30: python_test_variable
  30/34 Test #30: python_test_variable .............   Passed    0.06 sec
        Start 31: python_test_validator
  31/34 Test #31: python_test_validator ............   Passed    0.06 sec
        Start 32: python_test_version
  32/34 Test #32: python_test_version ..............   Passed    0.05 sec
        Start 33: python_test_when
  33/34 Test #33: python_test_when .................   Passed    0.06 sec
        Start 34: python_test_docstrings
  34/34 Test #34: python_test_docstrings ...........   Passed    0.06 sec
  
  100% tests passed, 0 tests failed out of 34
  
  Total Test time (real) =   4.06 sec
  Scanning dependencies of target clean_coverage
  [  1%] Clean old coverage data
  [  1%] Built target clean_coverage
  [ 16%] Built target cellml
  [ 18%] Built target _printer
  [ 21%] Built target _variable
  [ 23%] Built target _validator
  [ 25%] Built target _units
  [ 27%] Built target _entity
  [ 29%] Built target _enumerations
  [ 31%] Built target ___init__
  [ 33%] Built target _version
  [ 35%] Built target _error
  [ 37%] Built target _componententity
  [ 40%] Built target _logger
  [ 42%] Built target _component
  [ 44%] Built target _importedentity
  [ 46%] Built target _model
  [ 48%] Built target _parser
  [ 50%] Built target _specificationrule
  [ 52%] Built target _reset
  [ 54%] Built target _importsource
  [ 56%] Built target _namedentity
  [ 58%] Built target _orderedentity
  [ 61%] Built target _when
  Scanning dependencies of target python_bindings
  [ 61%] Built target python_bindings
  [ 63%] Built target gtest
  [ 64%] Built target gtest_main
  [ 66%] Built target test_error
  [ 68%] Built target test_units
  [ 70%] Built target test_math
  [ 73%] Built target test_component
  [ 76%] Built target test_parser
  [ 78%] Built target test_reset
  [ 81%] Built target test_printer
  [ 83%] Built target test_resolve_imports
  [ 85%] Built target test_coverage
  [ 87%] Built target test_variable
  [ 89%] Built target test_connection
  [ 91%] Built target test_version
  [ 93%] Built target test_validator
  [ 96%] Built target test_when
  [100%] Built target test_model
  Scanning dependencies of target prepare_coverage
  [100%] Prepare for coverage tests
  [100%] Built target prepare_coverage
  Scanning dependencies of target coverage
  [100%] Running coverage tests
  ------------------------------------------------------------------------------
                             libCellML Code Coverage Report
  Directory: /usr/code/build-libcellml-release/src/CMakeFiles/cellml.dir
  ------------------------------------------------------------------------------
  File                                       Lines    Exec  Cover   Missing
  ------------------------------------------------------------------------------
  /component.cpp                               135     135   100%   
  /componententity.cpp                         137     137   100%   
  /entity.cpp                                   54      54   100%   
  /error.cpp                                   136     136   100%   
  /importedentity.cpp                           36      36   100%   
  /importsource.cpp                             37      37   100%   
  /logger.cpp                                   34      34   100%   
  /model.cpp                                   157     157   100%   
  /namedentity.cpp                              28      28   100%   
  /orderedentity.cpp                            36      36   100%   
  /parser.cpp                                  923     923   100%   
  /printer.cpp                                 333     333   100%   
  /reset.cpp                                    76      76   100%   
  /units.cpp                                   141     141   100%   
  /utilities.cpp                                71      71   100%   
  /validator.cpp                               600     600   100%   
  /variable.cpp                                158     158   100%   
  /version.cpp                                   5       5   100%   
  /when.cpp                                     34      34   100%   
  /xmlattribute.cpp                             41      41   100%   
  /xmldoc.cpp                                   50      50   100%   
  /xmlnode.cpp                                  77      77   100%   
  ------------------------------------------------------------------------------
  TOTAL                                       3299    3299   100%
  ------------------------------------------------------------------------------
  [100%] Built target coverage
  [  3%] Built target gtest
  [ 31%] Built target cellml
  [ 33%] Built target gtest_main
  [ 38%] Built target test_model
  Scanning dependencies of target prepare_memcheck
  [ 40%] Prepare for memcheck tests
  [ 40%] Built target prepare_memcheck
  [ 44%] Built target test_error
  [ 48%] Built target test_units
  [ 51%] Built target test_math
  [ 57%] Built target test_component
  [ 62%] Built target test_parser
  [ 66%] Built target test_reset
  [ 70%] Built target test_printer
  [ 74%] Built target test_resolve_imports
  [ 77%] Built target test_coverage
  [ 81%] Built target test_variable
  [ 85%] Built target test_connection
  [ 88%] Built target test_version
  [ 92%] Built target test_validator
  [ 98%] Built target test_when
  Scanning dependencies of target memcheck
  [100%] Running memcheck tests
  >> running valgrind memcheck on: 'test_component' - PASS
  >> running valgrind memcheck on: 'test_connection' - PASS
  >> running valgrind memcheck on: 'test_coverage' - PASS
  >> running valgrind memcheck on: 'test_error' - PASS
  >> running valgrind memcheck on: 'test_math' - PASS
  >> running valgrind memcheck on: 'test_model' - PASS
  >> running valgrind memcheck on: 'test_parser' - PASS
  >> running valgrind memcheck on: 'test_printer' - PASS
  >> running valgrind memcheck on: 'test_reset' - PASS
  >> running valgrind memcheck on: 'test_resolve_imports' - PASS
  >> running valgrind memcheck on: 'test_units' - PASS
  >> running valgrind memcheck on: 'test_validator' - PASS
  >> running valgrind memcheck on: 'test_variable' - PASS
  >> running valgrind memcheck on: 'test_version' - PASS
  >> running valgrind memcheck on: 'test_when' - PASS
  >> Summary
     100.0% tests passed, 0 tests failed out of 15
  
  [100%] Built target memcheck
  The libCellML repository passed all tests.

