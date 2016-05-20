[![Build Status](https://travis-ci.org/miroi/fortran_input_reader.svg?branch=master)](https://travis-ci.org/miroi/fortran_input_reader/builds)
[![wercker status](https://app.wercker.com/status/39f34b3fa3619e3b1ac48e9232ddb315/s "wercker status")](https://app.wercker.com/project/bykey/39f34b3fa3619e3b1ac48e9232ddb315)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/miroi/fortran_input_reader?branch=master&svg=true)](https://ci.appveyor.com/project/miroi/fortran_input_reader/history)
[![Coverage Status](https://coveralls.io/repos/miroi/fortran_input_reader/badge.svg?branch=master&service=github)](https://coveralls.io/github/miroi/fortran_input_reader?branch=master)
[![shippable status](https://api.shippable.com/projects/55c5fa6fedd7f2c05299e675/badge?branchName=master)](https://app.shippable.com/projects/55c5fa6fedd7f2c05299e675/builds/latest)
[![CircleCI](https://circleci.com/gh/miroi/fortran_input_reader/tree/master.svg?style=svg)](https://circleci.com/gh/miroi/fortran_input_reader/tree/master)


Fortran Input Reader
====================

All-Fortran90 reader of most common input keywords types (strings, numbers, number arrays) from a text file.

This project also serves as the comprehensive (unit) tester of the standalone Fortran module (library).

The two files for free distribution into your codes are 
[input_reader.F90](https://github.com/miroi/fortran_input_reader/blob/master/src/lib/input_reader.F90) (as module)
and [
parse_input.F90](https://github.com/miroi/fortran_input_reader/blob/master/src/lib/parse_input.F90) (as subroutine).
Note that you have to supply the [QUIT routine](https://github.com/miroi/fortran_input_reader/blob/master/src/lib/quit.F90)
which is part of DIRAC and Dalton programs, from where the input reader comes.

Some Fortran Input Reader advocacy is on the [DIRAC web-page](http://diracprogram.org/doc/master/programmers/input_reading.html).

Buildup and testing
-------------------
The project buildup is based solely on the [*autocmake* project](https://github.com/scisoft/autocmake).


For the buildup and run you need python, cmake and fortran software.

From the main directory launch, the setup command (see python setup --help):
```
 python setup --fc=gfortran build_gfortran
 cd build_gfortran
 make
 bin/example
```
The buildup flavors, using open-software only, can be seen in project's CI scripts,
like [shippable.yml](https://github.com/miroi/fortran_input_reader/blob/master/shippable.yml),
[wercker.yml](https://github.com/miroi/fortran_input_reader/blob/master/wercker.yml),
[.travis-ci.yml](https://github.com/miroi/fortran_input_reader/blob/master/.travis.yml).


Upon successfull finish of the executable code you should see the last printed line
```
.
.
Fortran Input Reader OK!
```
