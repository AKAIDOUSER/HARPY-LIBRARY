local IconsLibrary = {}

function IconsLibrary:LoadIcons(iconsUrl)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(iconsUrl))()
    end)
    
    if success and type(result) == "table" then
        IconsLibrary.Icons = result
        return true
    else
        warn("Falha ao carregar ícones: " .. tostring(result))
        IconsLibrary.Icons = {}
        return false
    end
end

function IconsLibrary:GetIcon(iconName)
    if IconsLibrary.Icons and IconsLibrary.Icons[iconName] then
        return IconsLibrary.Icons[iconName]
    end
    return nil
end

return IconsLibrary
