ESX  = nil 

local blur = "Kim_Dimension"
local ChannalNow = 0
local Inzone = false

Citizen.CreateThread(function() 
	while ESX == nil do 
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
		Citizen.Wait(1) 
	end 
		PlayerData = ESX.GetPlayerData() 
end) 

Citizen.CreateThread(function()
	while true do
    local Sleepthred = 1500
    local playerPed = PlayerPedId()
    local coords   = GetEntityCoords(playerPed)
    for k, v in pairs(Kim.Zones) do
        if GetDistanceBetweenCoords(coords, v.coords, true) <= v.Size  then
            Sleepthred = 7
            if not v.inzone then
                v.inzone = true
                v.outzone = false
            end
        else
            if not v.outzone then
                closemenu2()
                if ChannalNow > 0 then
                    Sleepthred = 1
                    SwitchOutPlayer(PlayerPedId(), 0, 1)
                    TriggerServerEvent("Kim_Dimension:Setdimension", 0)
                    TriggerEvent('CheckChannal', 1)
                    ChannalNow = 0
                    Wait(3000)
                    exports['pNotify']:Notification({
                        position = 'middleLeft', ------ โชว์แจ้งเตือนขวากลาง
                        image ='peepo-run.gif',
                        title ='กลับมิติหลัก',
                        description ='กลับมิติหลัก',
                        type ='success',
                        time = 5000,
                    })    
                    SwitchInPlayer(PlayerPedId())
                    SendNUIMessage({
                        action = 'updateDimension',
                        dimension = 0
                    })            
                    closemenu2()
                end        
                v.outzone = true
                v.inzone = false
            end
        end
    end
    Citizen.Wait(Sleepthred)
end
end)

Citizen.CreateThread(function()
    while true do
        local timesleep = 2000
        local ped = PlayerPedId()
        
        for k, v in pairs(Kim.Zones) do
            if v.inzone then
                timesleep = 7
                OpenMenu1()
                if IsControlJustPressed(0, 38) then
                    OpenMenu()
                    SetNuiFocus(true, true)
                    StartScreenEffect(blur, 1)
                end
            end
        end
        Citizen.Wait(timesleep)
    end
end)

function OpenMenu()
    SendNUIMessage({
        action = 'openUi1'
    })
end

function OpenMenu1()
    SendNUIMessage({
        action = 'openUi'
    })
end

function closemenu()
    SendNUIMessage({
        action = 'closeui'
    })
end

function closemenu2()
    SendNUIMessage({
        action = 'closeui2'
    })
end

RegisterNUICallback('action', function(data, cb)
    if data.action == 'close' then
        StopScreenEffect(blur)
        SetNuiFocus(false, false)
    elseif data.action == 'framjoin1' then
        TriggerServerEvent("Kim_Dimension:Setdimension", 0)
        TriggerEvent('CheckChannal', 1)
        ChannalNow = 0
        closemenu()
        StopScreenEffect(blur)
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'updateDimension',
            dimension = 0
        })
    elseif data.action == 'framjoin2' then
        TriggerServerEvent("Kim_Dimension:Setdimension", 1)
        TriggerEvent('CheckChannal', 2)
        ChannalNow = 1
        closemenu()
        StopScreenEffect(blur)
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'updateDimension',
            dimension = 1
        })
    elseif data.action == 'framjoin3' then
        TriggerServerEvent("Kim_Dimension:Setdimension", 2)
        TriggerEvent('CheckChannal', 3)
        ChannalNow = 2
        closemenu()
        StopScreenEffect(blur)
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'updateDimension',
            dimension = 2
        })
    elseif data.action == 'framjoin4' then
        TriggerServerEvent("Kim_Dimension:Setdimension", 3)
        TriggerEvent('CheckChannal', 4)
        ChannalNow = 3
        closemenu()
        StopScreenEffect(blur)
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'updateDimension',
            dimension = 3
        })
    elseif data.action == 'framjoin5' then
        TriggerServerEvent("Kim_Dimension:Setdimension", 4)
        TriggerEvent('CheckChannal', 5)
        ChannalNow = 4
        closemenu()
        StopScreenEffect(blur)
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'updateDimension',
            dimension = 4
        })
    end
end)


--ตรวจสอบ nui เวลาเปลี่ยนมิติแล้วชื่อเปลี่ยน
function GetDimention()
    return tonumber(now_dimention)
end

--ส่งค่า Dimension ปัจจุบัน
exports('GetDimention', GetDimention)


--เปิดให้ไปใส่ฟั่งชั่นกับสคริปอื่นได้เอาไว้พัฒนา
local Chanel = nil
RegisterNetEvent("Chanel:ID")
AddEventHandler("Chanel:ID", function(id)
    Chanel = id
end)

