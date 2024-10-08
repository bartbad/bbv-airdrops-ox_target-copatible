

Wrapper = {
    blip = {},
    cam = {},
    zone = {},
    cars = {},
    object = {}
}

function Wrapper:CreateObject(id,prop,coords,network,misson) -- Create object / prop
    self.LoadModel(prop)
    --------print(id)
    Wrapper.object[id] = CreateObject(GetHashKey(prop), coords, network or false,misson or false)
    --------print(Wrapper.object[id])
    PlaceObjectOnGroundProperly(Wrapper.object[id])
    SetEntityHeading(Wrapper.object[id], coords.w)
    FreezeEntityPosition(Wrapper.object[id], true)
    SetEntityAsMissionEntity(Wrapper.object[id], true, true)
    --------print(Wrapper.object[id])
    --------print(GetEntityCoords(Wrapper.object[id]))
end


function Wrapper:DeleteObject(id)
    DeleteObject(Wrapper.object[id])
end

function Wrapper:LoadModel(model) -- Load Model
    local modelHash = model
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
      Wait(0)
      --------print('loading')
    end
    --------print('yess')
end




function Wrapper:Blip(id,label,pos,sprite,color,scale) -- Create Normal Blip on Map
    --print(id,label,pos,sprite,color,scale)
    --print(pos.x)
    Wrapper.blip[id] = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite (Wrapper.blip[id], sprite)
    SetBlipDisplay(Wrapper.blip[id], 4)
    SetBlipScale  (Wrapper.blip[id], scale)
    SetBlipAsShortRange(Wrapper.blip[id], true)
    SetBlipColour(Wrapper.blip[id], color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(label)
    EndTextCommandSetBlipName(Wrapper.blip[id])
    return
end

function Wrapper:RemoveBlip(id)
    RemoveBlip(Wrapper.blip[id])
end

function Wrapper:Notify(txt,tp,time) -- QBCore notify
    if Config.Settings.Framework == "QB" then 
    QBCore.Functions.Notify(txt, tp, time)
    end
    if Config.Settings.Framework == "ESX" then 
        exports['shinyx-hud']:sendNotify(txt)
    end
    if Config.Settings.Framework == "ST" then 
        SetNotificationTextEntry('STRING')
        AddTextComponentString(txt)
        DrawNotification(0,1)    
    end
end



function Wrapper:AddItem(item,amount) -- AddItem to me (Like give item) very unsafe use only in dev build.
    Wait(1000)
    TriggerServerEvent('Wrapper2:airdrop::AddItem',item,amount)
end

function Wrapper:RemoveItem(item,amount)
    TriggerServerEvent('Wrapper2:airdrop::RemoveItem', item, amount)
end



function Wrapper:Log(webhook,txt) -- Log all of your abusive staff
    TriggerServerEvent('Wrapper:Log',webhook,txt)
end



function Wrapper:AlertPolice()
-- // insert custom police alert command here

end

function Wrapper:Prompt(b) --Msg is part of the Text String at B
	SetNotificationTextEntry('STRING')
	AddTextComponentString(b) -- B
	DrawNotification(true, false) 
end