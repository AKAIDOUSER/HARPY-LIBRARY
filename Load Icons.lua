-- Sistema de Load de Ícones Corrigido
local IconsLibrary = {}

function IconsLibrary:LoadIcons(iconsUrl)
    local success, result = pcall(function()
        local iconsScript = game:HttpGet(iconsUrl)
        return loadstring(iconsScript)()
    end)
    
    if success and type(result) == "table" then
        IconsLibrary.Icons = result
        --print("✅ Ícones carregados com sucesso! Total: " .. #result)
        return print
    else
        warn("❌ Falha ao carregar ícones: " .. tostring(result))
        IconsLibrary.Icons = {}
        return false
    end
end

function IconsLibrary:GetIcon(iconName)
    if IconsLibrary.Icons and IconsLibrary.Icons[iconName] then
        return IconsLibrary.Icons[iconName]
    else
        warn("Ícone não encontrado: " .. tostring(iconName))
        return nil
    end
end

return IconsLibrary
