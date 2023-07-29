local display = false
local prop = false
local news ={}

news.Open = function()
    SendNUIMessage({
        action = "open"
    })
	newspaper = CreateObject(GetHashKey("prop_cliff_paper"), 0, 0, 0, true, true, true)
	RequestAnimDict("missfam4")
	while not HasAnimDictLoaded("missfam4") do Citizen.Wait(5) end
	TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 2.0, -1, 33, 0.0, false, false, false)
	AttachEntityToEntity(newspaper, PlayerPedId(), GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.26, 0.06, 0.16, 320.0, 310.0, 0.0, true, true, false, true, 1, true)
    SetNuiFocus(true, true)
    display = true
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
	ClearPedTasks(PlayerPedId())
	Citizen.Wait(200)
	DeleteObject(newspaper)
    display = false
end)

RegisterNetEvent('news:open',function()
	news.Open()
end)

local skrzynki = { 1211559620, 720581693, -1186769817, -377891123, }
exports['qtarget']:AddTargetModel(skrzynki, { -- Red Daily Rag Dispenser
    options = {
        {
            type = "client",
            event = "news:open",
            icon = "fa fa-list-alt",
            label = "Przeczytaj gazetę",
        },
    },
    distance = 2.5
})