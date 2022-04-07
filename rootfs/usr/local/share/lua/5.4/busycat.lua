local busycat = {}

-- Input function
busycat.input = function()
    return io.stdin:read()
end

busycat.init = function()
    print("Potato Init")
    dofile("/etc/init.d/1")
end

-- Trash SHell
busycat.tsh = function()
    while true do
        io.stdout:write("> ")
        local command = busycat.input()
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

return busycat
