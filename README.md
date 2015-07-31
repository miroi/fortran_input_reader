[![Build Status](https://travis-ci.org/miroi/fortran_input_reader.svg?branch=master)](https://travis-ci.org/miroi/fortran_input_reader/builds)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/miroi/fortran_input_reader?branch=master&svg=true)](https://ci.appveyor.com/project/miroi/fortran_input_reader/history)
[![Coverage Status](https://coveralls.io/repos/miroi/fortran_input_reader/badge.svg?branch=release)](https://coveralls.io/r/miroi/fortran_input_reader?branch=release)
[![Coverity Scan Build](https://scan.coverity.com/projects/5926/badge.svg)](https://scan.coverity.com/projects/5926)


Fortran Input Reader
====================

All-Fortran90 reader of most common types of input keywords (string, numbers..) from a text file.

This project also serves as the comprehensive (unit) tester of the standalone Fortran module (library).

Two files for free distribution into your codes are 
[input_reader.F90](https://github.com/miroi/fortran_input_reader/blob/master/src/lib/input_reader.F90) (as module)
and [
parse_input.F90](https://github.com/miroi/fortran_input_reader/blob/master/src/lib/parse_input.F90) (as subroutine).
Note that you have to supply the [QUIT routine](https://github.com/miroi/fortran_input_reader/blob/master/src/lib/quit.F90)
which is part of DIRAC and Dalton programs, from where the input reader comes.

Some Fortran Input Reader advocacy is on the [DIRAC web-page](http://diracprogram.org/doc/master/programmers/input_reading.html).

Testing and buildup
-------------------
The project buildup and testing is based on the [*autocmake* project](https://github.com/scisoft/autocmake).

For testing (needs pytest), type:
```
 py.test -v test.py
```

For the buildup (needs fortran) and subsequent testing, type:
```
 python setup.py 
 cd build
 make
 cd bin
 cp ../../src/example/EXAMPLE.INP .
 example
```
Upon successfull finish of the executable code you should get in the last printed line
```
Fortran Input Reader OK!
```

