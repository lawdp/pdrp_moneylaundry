ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_moneywash:withdraw')
AddEventHandler('esx_moneywash:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)
	local accountMoney = 0
	accountMoney = xPlayer.getAccount('black_money').money
	if amount == nil or amount <= 0 or amount > accountMoney then
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	else
		xPlayer.removeAccountMoney('black_money', amount)
		society_money = tonumber((amount / 100) * 30)
		amount = amount - society_money
		xPlayer.addMoney(amount)
		TriggerClientEvent('esx:showNotification', _source, _U('wash_money') .. amount .. '~s~.')
		TriggerClientEvent('esx_moneywash:closeWASH', _source)

		MySQL.Async.execute(
			'UPDATE `addon_account_data` SET `money` = `money` + @society_money WHERE `account_name` = @account_name', {
				['@society_money']	= society_money,
				['@account_name']	= 'society_dlaundry'
			}, function(updated)

			end
		)
	end
end)