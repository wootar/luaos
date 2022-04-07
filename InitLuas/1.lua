print("There's nothing to start, escaping to the shell!")
if tsh == nil then
    os.exit(1)
else
    tsh()
end