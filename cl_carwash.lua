-- Déclaration ESX --

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(2500)
    end
end)

-- Création Event Pour Nettoyer la voiture --

RegisterNetEvent('Anarchy:CleanCar')
AddEventHandler('Anarchy:CleanCar', function()
    local cleanvehicule = WashDecalsFromVehicle(GetVehiclePedIsUsing(PlayerPedId()), -1) -- Definir le vehicule a laver 
    SetVehicleDirtLevel(cleanvehicule, 0) -- Definir le niveau de propreter du vehicule 
end)

function menu()

    local MainMenu = RageUI.CreateMenu(_U('name_menu')," ")
    MainMenu:SetRectangleBanner(145, 33, 217)

    RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))

    while MainMenu do
        
        Citizen.Wait(0)

        RageUI.IsVisible(MainMenu,true,true,true,function()
        
            RageUI.ButtonWithStyle(_U('name_button1'), nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
                if Selected then    
                    DoScreenFadeOut(100)
                    Citizen.Wait(750)           
                    DoScreenFadeIn(100)
                    TriggerServerEvent('Anarchy:FinalCleanVehicules', Config.Global.price)
                    RageUI.CloseAll()
                end
            end)

            RageUI.ButtonWithStyle(_U('name_button2'),nil, {Color = {BackgroundColor = { 231, 20, 20}}}, true, function(Hovered, Active, Selected)
                if Selected then  
                    RageUI.CloseAll()  
                end
            end)  

        
        end, function()
        end)

        if not RageUI.Visible(MainMenu) then
            MainMenu=RMenu:DeleteType("CarWash", true)
        end

    end

end

-- Création du Blips  

Citizen.CreateThread(function()
    if Config.VisualBlips then 
        for k, v in pairs(Config.Global.Blips) do 

        local blips = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blips, 100)
            SetBlipColour(blips, 50)
            SetBlipScale(blips, 0.60)
            SetBlipAsShortRange(blips, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(_U('name_blip'))
            EndTextCommandSetBlipName(blips)
        end
    end
end)

-- Création du Marker  

Citizen.CreateThread(function()
    while true do
      local wait = 500
      local playerCoords = GetEntityCoords(PlayerPedId())

      for k, v in pairs(Config.Global.Marker) do

        local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

        if distance <= 5.0 then
          wait = 7
		  DrawMarker(29, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.4, 0.4, 0.4, 0, 0, 0, 255, false, true, p19, true) 

        if distance <= 1.5 then
         wait = 7
            AddTextEntry("HELP", _U('message_buy'))
            DisplayHelpTextThisFrame("HELP", false)

            if IsControlJustPressed(1, 51) then
                menu()
                  end
              end
          end
        end
          Citizen.Wait(0)
    end
end)