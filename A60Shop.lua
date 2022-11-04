local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()


-- Create your tool here
local exampleTool = LoadCustomInstance("rbxassetid://11460895959")


-- Create custom shop item
CustomShop.CreateItem(exampleTool, {
    Title = "A-60",
    Desc = "Shake my balls kid.",
    Image = "https://static.wikia.nocookie.net/r-rooms/images/b/bf/SIXTYOVERLAP.png/revision/latest/scale-to-width-down/350?cb=20221018181132",
    Price = 10,
    Stack = 1,
})
