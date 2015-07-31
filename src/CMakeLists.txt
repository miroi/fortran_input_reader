#
add_library(input_reader 
        lib/quit.F90
        lib/input_reader.F90
        lib/parse_input.F90)

add_executable(example example/example.F90 example/checkdata.F90)

target_link_libraries(example input_reader)
