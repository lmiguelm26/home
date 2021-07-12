local CONFIG_TPS_JANELA = {
	[19090] = { -- ID do action que ficará no portal da hunt
				[1] = {nome = "Scarllet", Position = Position(33395, 32666, 6)},
				[2] = {nome = "Grand Master Oberon", Position = Position(33297, 31285, 9)},
				[3] = {nome = "Count Vlarkorth", Position = Position(33456, 31406, 13)},
				[4] = {nome = "Duke Krule", Position = Position(33457, 31499, 13)},
				[5] = {nome = "Earl Osam", Position = Position(33426, 31406, 13)},
				[6] = {nome = "Izcandar The Banished", Position = Position(32231, 32024, 13)},
				[7] = {nome = "King Zelos", Position = Position(33493, 31545, 13)},
				[8] = {nome = "Lord Azaram", Position = Position(33423, 31499, 13)},
				[9] = {nome = "Maxxenius", Position = Position(32253, 32024, 13)},
				[10] = {nome = "The Pale Worm", Position = Position(33781, 31504, 14)},
				[11] = {nome = "The Nightmare Beast", Position = Position(32212, 32076, 15)},
				[12] = {nome = "The Fear Feaster", Position = Position(33743, 31473, 14)},
				[13] = {nome = "The Dread Maiden", Position = Position(33747, 31507, 14)},
				[14] = {nome = "The Unwelcome", Position = Position(33746, 31538, 14)},
				[15] = {nome = "The Last Lore Keeper", Position = Position(32040, 32859, 14)},
				[16] = {nome = "Urmahlullu The Immaculate", Position = Position(33917, 31609, 8)},
},
}
function DestinatiHunt(tableJanelas, player)
	player:teleportTo(tableJanelas.Position)
	tableJanelas.Position:sendMagicEffect(CONST_ME_TELEPORT)	
end

local teleport = MoveEvent()
function teleport.onStepIn(creature, item, position, fromPosition)		
	
	if not creature:isPlayer() then
		return false
	end
	
	local window = ModalWindow {
		title = "Teleports",
		message = "Selecione o BOSS que deseja ir:",
	}
	
	local tpJanelas = CONFIG_TPS_JANELA[item:getActionId()]

	if tpJanelas then		
		for i, v in ipairs(tpJanelas) do
			local choice = window:addChoice(v.nome)
				  choice.tpJanela = i
		end
		
		window:addButton("Confirmar",
			function(button, choice)			
				if creature and choice then						
					DestinatiHunt(tpJanelas[choice.tpJanela], creature)
				end
				return true
			end
		)
		
		window:addButton("Sair",
			function(button, choice)			
				if creature then				
					fromPosition:sendMagicEffect(CONST_ME_POFF)
					creature:teleportTo(fromPosition, false)
				end
				return true
			end
		)	
		
		window:setDefaultEnterButton("Confirmar")
		window:setDefaultEscapeButton("Sair")
		window:sendToPlayer(creature)
	end
	
	return true
end
teleport:type("stepin")
teleport:aid(19090)
teleport:register()