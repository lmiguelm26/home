local tpmodal = CreatureEvent("tpmodal")

function tpmodal.onModalWindow(player, teleport, modalWindowId, buttonId, choiceId)
	player:registerEvent("janela locais")
	print("UnregisterEvent Janelas")
	if (modalWindowId == 1000) then
		if (buttonId == 100) then
			local tele_pos = CONFIG_TPS_JANELA[JANELA_TP_ACTION][choiceId].pos
			teleport(tele_pos)
			print("Setando Destination")
			local pos_t = Position(tele_pos)
			pos_t:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end

tpmodal:register()