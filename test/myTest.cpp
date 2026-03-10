#include "myModule.h" // Header file from "src/"

#include "gtest/gtest.h"

TEST(Name, Subname)
{
	EXPECT_EQ(hello(), "Hello World");
}
