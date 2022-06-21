# GTest include code would
# go somewhere in here

add_executable(
    run_tests 
    jsonmerge.test.cpp
)

target_link_libraries(
    run_tests
    gtest_main 
    gtest
    jsonmerge
)

include(GoogleTest)
gtest_discover_tests(run_tests)