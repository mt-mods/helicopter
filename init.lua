--
-- constants
--

helicopter = {}

helicopter.S = core.get_translator(core.get_current_modname())

helicopter.friction_air_quadratic = 0.01
helicopter.friction_air_constant = 0.2
helicopter.friction_land_quadratic = 1
helicopter.friction_land_constant = 2
helicopter.friction_water_quadratic = 0.1
helicopter.friction_water_constant = 1

helicopter.colors ={
    black='#2b2b2b',
    blue='#0063b0',
    brown='#8c5922',
    cyan='#07B6BC',
    dark_green='#567a42',
    dark_grey='#6d6d6d',
    green='#4ee34c',
    grey='#9f9f9f',
    magenta='#ff0098',
    orange='#ff8b0e',
    pink='#ff62c6',
    red='#dc1818',
    violet='#a437ff',
    white='#FFFFFF',
    yellow='#ffe400',
}

dofile(core.get_modpath("nss_helicopter") .. "/settings.lua")
--dofile(core.get_modpath(core.get_current_modname()) .. "/heli_hud.lua")
dofile(core.get_modpath("nss_helicopter") .. "/heli_hud.lua")
dofile(core.get_modpath("nss_helicopter") .. "/heli_utilities.lua")
dofile(core.get_modpath("nss_helicopter") .. "/heli_entities.lua")
dofile(core.get_modpath("nss_helicopter") .. "/heli_crafts.lua")
dofile(core.get_modpath("nss_helicopter") .. "/heli_control.lua")
dofile(core.get_modpath("nss_helicopter") .. "/heli_fuel_management.lua")


helicopter.helicopter_last_time_command = 0

--
-- helpers and co.
--

if not core.global_exists("matrix3") then
	dofile(core.get_modpath("nss_helicopter") .. "/matrix.lua")
end

helicopter.creative = core.global_exists("creative")

function helicopter.check_is_under_water(obj)
	local pos_up = obj:get_pos()
	pos_up.y = pos_up.y + 0.1
	local node_up = core.get_node(pos_up).name
	local nodedef = core.registered_nodes[node_up]
	local liquid_up = nodedef.liquidtype ~= "none"
	return liquid_up
end






