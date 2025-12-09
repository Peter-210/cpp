#include "gtest/gtest.h"
#include "header.h" // Header file from "src/"

TEST(Name, Subname) {
	EXPECT_EQ(hello(), "Hello World");
}
