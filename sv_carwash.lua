ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('Anarchy:FinalCleanVehicules')
AddEventHandler('Anarchy:FinalCleanVehicules', function(price)

        _src = source
        local xPlayer = ESX.GetPlayerFromId(_src)
        local BankWallet = xPlayer.getAccount('bank').money
        local WalletPlayer = xPlayer.getMoney()

        if WalletPlayer >= price then 
            xPlayer.removeMoney(price)
            TriggerClientEvent('Anarchy:CleanCar', _src)
            TriggerClientEvent('esx:showAdvancedNotification', _src, _U('name_blip'), "<C>~p~TeamAnarchyDev", _U('notification_true_money'), "CHAR_BANK_FLEECA", 8)
            sendToDiscordWithSpecialURL(_U('name_blip'), _U("players")..xPlayer.getName().._U("message_webhook_money"), 6957026, Config.WebHooks)

        elseif BankWallet >= price then
            xPlayer.removeAccountMoney('bank', price)
            TriggerClientEvent('Anarchy:CleanCar', _src)
            TriggerClientEvent('esx:showAdvancedNotification', _src, _U('name_blip'), "<C>~p~TeamAnarchyDev", _U('notification_true_bank'), "CHAR_BANK_FLEECA", 8)
            sendToDiscordWithSpecialURL(_U('name_blip'), _U("players")..xPlayer.getName().._U("message_webhook_bank"), 6957026, Config.WebHooks)

        else 
            TriggerClientEvent('esx:showAdvancedNotification', _src, _U('name_blip'), "<C>~p~TeamAnarchyDev", _U('notification_false'), "CHAR_BANK_FLEECA", 8)
    end
end)

function sendToDiscordWithSpecialURL(name,message,color,url)
    local DiscordWebHook = url
	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= "CarWash by TeamAnarchyDev",
			},
		}
	}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "CarWash",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end