#
add_library(input_reader 
        lib/input_reader.F90
        lib/parse_input.F90)

add_executable(example1 examples/example1.f90)

target_link_libraries(example1 input_reader)
