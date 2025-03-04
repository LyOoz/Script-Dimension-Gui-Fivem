local GetCurrentResourceName = "Kim_Dimension"

RegisterNetEvent("Kim_Dimension:Setdimension")
AddEventHandler("Kim_Dimension:Setdimension", function(daimention)
    SetPlayerRoutingBucket(source,daimention)
    TriggerClientEvent('Chanel:ID', source, daimention)
end)


