#!/bin/lua

local busycat = require("busycat")

if arg[1] == nil then
    print("Do hek????")
elseif arg[1] == "init" then
    busycat.initinit()
elseif arg[1] == "tsh" then
    busycat.tsh()
end
