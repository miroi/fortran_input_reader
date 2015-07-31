[![Build Status](https://travis-ci.org/miroi/fortran_input_reader.svg?branch=master)](https://travis-ci.org/miroi/fortran_input_reader/builds)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/miroi/fortran_input_reader?branch=master&svg=true)](https://ci.appveyor.com/project/miroi/fortran_input_reader/history)
[![Coverage Status](https://coveralls.io/repos/miroi/fortran_input_reader/badge.svg?branch=release)](https://coveralls.io/r/miroi/fortran_input_reader?branch=release)
[![Coverity Scan Build](https://scan.coverity.com/projects/5926/badge.svg)](https://scan.coverity.com/projects/5926)


====================
Fortran Input Reader
====================

All-Fortran90 reader of most common types of input keywords (string, numbers..) from text filexs.

This project serves as comprehensive tester of the standalone Fortran module (library).

Files for free distribution are src/lib/input_reader.F90 and src/lib/parse_input.F90.

Input Reader documentation: http://diracprogram.org/doc/master/programmers/input_reading.html

Testing and buildup
-------------------
The project's buildup and testing is based on *autocmake* project, https://github.com/scisoft/autocmake.

For testing (needs pytest), type:
::
 py.test test.py

For buildup (needs fortran), type:
::
 python setup.py 
 cd build
 make




