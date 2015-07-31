#
add_library(input_reader 
        lib/input_reader.F90
        lib/parse_input.F90)

add_executable(example example/example.F90)

target_link_libraries(example input_reader)
