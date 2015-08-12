if(CMAKE_Fortran_COMPILER_ID MATCHES PGI)
    # remove -rdynamic flag offensive to PGI Fortran
    list(REMOVE_ITEM CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS "-rdynamic")
    add_definitions(-DVAR_PGI)
endif()
if(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
    # prevent ifort's warning
    list(REMOVE_ITEM CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS "-i_dynamic")
    add_definitions(-DVAR_INTEL)
endif()

add_library(input_reader 
        lib/quit.F90
        lib/input_reader.F90
        lib/parse_input.F90)

add_executable(example example/example.F90 example/checkdata.F90)

target_link_libraries(example input_reader)
