RegisterServerEvent('es:updateName')
AddEventHandler('es:updateName', function(prenom, nom)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		user:setNom(nom)
		user:setPrenom(prenom)
    local player = user.identifier
		MySQL:executeQuery("UPDATE users SET `nom`='@value' WHERE identifier = '@identifier'", {['@value'] = nom, ['@identifier'] = player})
		MySQL:executeQuery("UPDATE users SET `prenom`='@value' WHERE identifier = '@identifier'", {['@value'] = prenom, ['@identifier'] = player})
  end)
end)
