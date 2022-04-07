#!/bin/lua

-- Input function
local function input()
    return io.stdin:read()
end

local function init()
    print("Potato Init")
    dofile("/etc/init.d/1")
end

-- Trash SHell
local function tsh()
    while true do
        io.stdout:write("> ")
        local command = input()
        local a,err = load(command,"chunk","t")
        if a then
           local ok,fun = pcall(a)
           if ok then
                if fun == nil then
                else
               fun()
               fun = nil
                end
           else
            print("Command failed to execute!")
           end
        else
            print("Command not found or failed to run!") 
        end
        a = nil
    end
end
if arg[1] == nil then
    print("Do hek????")
elseif arg[1] == "init" then
    init()
elseif arg[1] == "tsh" then
    tsh()
end
