#include "gtest/gtest.h"

#include "bouncmpe/jsonmerge.hpp"

TEST(MyTests, Test1)
{
  int a = 10;
  int b = 12;

  int result = bouncmpe::add_two_integer(a, b);
  int expected = 22;

  EXPECT_EQ(result, expected);
}

TEST(MyTests, Test2)
{
  boost::json::value target = {{"key1", "v1"}, {"key2", "a"}};
  boost::json::value patch = {{"key1", "v2"}};

  boost::json::value result = bouncmpe::jsonmerge(target, patch);
  boost::json::value expected = {{"key1", "v2"}, {"key2", "a"}};

  EXPECT_EQ(result, expected);
}

// Complete the test suite by writing more tests...
// When is it a good time to stop writing more tests?
