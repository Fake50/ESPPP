--[[
    Чистый шаблон GUI на WindUI.
    Никакой игровой логики здесь нет — только структура интерфейса.
    Вставь свой собственный loadstring WindUI (официальный, с их репозитория/доков)
    и допиши свою логику в местах с пометкой "-- TODO: твоя логика".
]]

local WindUI = loadstring(game:HttpGet("ВСТАВЬ_СЮДА_ОФИЦИАЛЬНУЮ_ССЫЛКУ_WINDUI"))()

-- === Окно ===
local Window = WindUI:CreateWindow({
    Title = "My Hub",
    Icon = "rbxassetid://0",
    Author = "by You",
    Folder = "MyHub",          -- папка для сохранения конфигов/тогглов
    Size = UDim2.fromOffset(580, 440),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
})

-- === Вкладки ===
local Tabs = {
    Main     = Window:Tab({ Title = "Main",     Icon = "home" }),
    Settings = Window:Tab({ Title = "Settings", Icon = "settings" }),
}

-- === Вкладка Main ===
Tabs.Main:Section({ Title = "General" })

Tabs.Main:Toggle({
    Title = "Example Toggle",
    Default = false,
    Callback = function(state)
        -- TODO: твоя логика при включении/выключении
    end
})

Tabs.Main:Slider({
    Title = "Example Slider",
    Step = 1,
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(value)
        -- TODO: твоя логика на изменение значения
    end
})

Tabs.Main:Dropdown({
    Title = "Example Dropdown",
    Values = { "Option 1", "Option 2", "Option 3" },
    Default = "Option 1",
    Callback = function(value)
        -- TODO: твоя логика на выбор опции
    end
})

Tabs.Main:Button({
    Title = "Example Button",
    Callback = function()
        WindUI:Notify({ Title = "Hub", Content = "Кнопка нажата", Duration = 3 })
    end
})

-- === Вкладка Settings ===
Tabs.Settings:Section({ Title = "Appearance" })

Tabs.Settings:Dropdown({
    Title = "Theme",
    Values = { "Dark", "Light" },
    Default = "Dark",
    Callback = function(value)
        WindUI:SetTheme(value)
    end
})

Tabs.Settings:Keybind({
    Title = "Toggle UI",
    Default = "RightShift",
    Callback = function()
        Window:Toggle()
    end
})

Window:SelectTab(1)
